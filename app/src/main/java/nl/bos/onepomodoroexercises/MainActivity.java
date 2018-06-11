package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
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
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, Runnable {
    private static final String TAG = MainActivity.class.getSimpleName();
    private final List<Exercise> exercises = new ArrayList<>();
    private ExerciseAdapter adapter;
    private TextView timer;
    private Thread timerThread;
    private int countDownTimer = (25 * 60) + 10;
    private int exercisesDone = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "onCreate...");
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
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(TAG, "click " + id);
        Exercise exercise = (Exercise) adapterView.getItemAtPosition(position);
        if (exercise.isDone()) {
            exercise.setDone(false);
            exercisesDone--;
        }
        else {
            exercise.setDone(true);
            exercisesDone++;
        }
        adapter.updateResults(exercises);
        TextView done = findViewById(R.id.txtDone);
        done.setText(String.format("%d/%d", exercisesDone, exercises.size()));

        try {
            Uri notification = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
            Ringtone r = RingtoneManager.getRingtone(getApplicationContext(), notification);
            r.play();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    }

    @Override
    public void run() {
        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable r = new Runnable() {
            public void run() {
                handler.postDelayed(this, 1000);
                if(countDownTimer >= 0)
                    timer.setText(String.format("%02d:%02d", countDownTimer / 60, countDownTimer % 60));
                else
                    timer.setText(String.format("-%02d:%02d", -(countDownTimer / 60), -(countDownTimer % 60)));
                countDownTimer--;
            }
        };
        handler.postDelayed(r, 0000);
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
            startActivity(new Intent(MainActivity.this, SettingsActivity.class));
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
