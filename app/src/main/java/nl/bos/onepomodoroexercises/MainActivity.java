package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, Runnable {
    private static final String TAG = MainActivity.class.getSimpleName();
    private static final int ONE_MINUTE = 60;
    private final List<Exercise> exercises = new ArrayList<>();
    private ExerciseAdapter adapter;
    private TextView timer;
    private Thread timerThread;
    private int countDownTimer = (25 * ONE_MINUTE) + 10;
    private int exercisesDone = 0;
    private MediaPlayer smsTone;
    private MediaPlayer btnStart;
    private MediaPlayer tmrRun;
    private MediaPlayer tmrHurry;
    private MediaPlayer tmrStart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "onCreate...");

        smsTone = MediaPlayer.create(this, R.raw.sms_tone);
        btnStart = MediaPlayer.create(this, R.raw.btn_click_sound);
        tmrRun = MediaPlayer.create(this, R.raw.tmr_beep_tone);
        tmrHurry = MediaPlayer.create(this, R.raw.tmr_beep_beep_beep);
        tmrStart = MediaPlayer.create(this, R.raw.tmr_beep);

        if (isOnline()) {
            setContentView(R.layout.activity_main);

            ListView viewExercises = findViewById(R.id.exercises);
            viewExercises.setOnItemClickListener(this);
            viewExercises.setOnItemLongClickListener(this);

            timer = findViewById(R.id.txtTimer);
            timerThread = new Thread(this);

            adapter = new ExerciseAdapter(this);
            viewExercises.setAdapter(adapter);
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(this);
            String jsonSetting = settings.getString("edit_text_json", null);
            new RetrieveDataTask(exercises, adapter, getApplicationContext(), this).execute(jsonSetting);
        } else {
            Toast toast = Toast.makeText(this, "No required internet connection available!", Toast.LENGTH_LONG);
            toast.show();
        }

    }

    private boolean isOnline() {
        ConnectivityManager cm =
                (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = Objects.requireNonNull(cm).getActiveNetworkInfo();
        return netInfo != null && netInfo.isConnectedOrConnecting();
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(TAG, "click " + id);
        Exercise exercise = (Exercise) adapterView.getItemAtPosition(position);
        if (exercise.isDone()) {
            exercise.setDone(false);
            exercisesDone--;
        } else {
            exercise.setDone(true);
            exercisesDone++;
        }
        adapter.updateResults(exercises);
        TextView done = findViewById(R.id.txtDone);
        done.setText(String.format("%d/%d", exercisesDone, exercises.size()));

        smsTone.start();
    }

    @Override
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(TAG, "long click " + id);
        exercises.remove(position);
        adapter.updateResults(exercises);
        return false;
    }

    public void onStartClick(View button) {
        Log.i(TAG, "Start click");
        timerThread.start();
        button.setEnabled(false);
        btnStart.start();
    }

    @Override
    public void run() {
        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable r = new Runnable() {
            public void run() {
                handler.postDelayed(this, 1000);
                if (countDownTimer >= 0)
                    timer.setText(String.format("%02d:%02d", countDownTimer / ONE_MINUTE, countDownTimer % ONE_MINUTE));
                else
                    timer.setText(String.format("-%02d:%02d", -(countDownTimer / ONE_MINUTE), -(countDownTimer % ONE_MINUTE)));
                countDownTimer--;
                if (countDownTimer == (25 * ONE_MINUTE) + 2 || countDownTimer == (25 * ONE_MINUTE) + 1 || countDownTimer == (25 * ONE_MINUTE))
                    tmrRun.start();
                if (countDownTimer == 2 || countDownTimer == 1 || countDownTimer == 0)
                    tmrRun.start();
                if (countDownTimer == ONE_MINUTE - 1)
                    tmrHurry.start();
                if (countDownTimer == (25 * ONE_MINUTE) - 1 || countDownTimer == -1)
                    tmrStart.start();
            }
        };
        handler.postDelayed(r, 0);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.miSettings) {
            Intent intent = new Intent(this, SettingsActivity.class);
            intent.putExtra("caller", this.getClass().getName());
            startActivity(intent);
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
