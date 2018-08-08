package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener {
    private static final String TAG = MainActivity.class.getSimpleName();
    private static final int ONE_MINUTE = 60;
    private final List<Exercise> exercises = new ArrayList<>();
    private ExerciseAdapter adapter;
    private int exercisesDone = 0;
    private MediaPlayer smsTone;
    private MediaPlayer btnTimer;
    private MediaPlayer tmrRun;
    private MediaPlayer tmrHurry;
    private MediaPlayer tmrStart;
    private boolean running = false;
    private int countDownTimer;
    private int timerLength;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "onCreate...");

        smsTone = MediaPlayer.create(this, R.raw.sms_tone);
        btnTimer = MediaPlayer.create(this, R.raw.btn_click_sound);
        tmrRun = MediaPlayer.create(this, R.raw.tmr_beep_tone);
        tmrHurry = MediaPlayer.create(this, R.raw.tmr_beep_beep_beep);
        tmrStart = MediaPlayer.create(this, R.raw.tmr_beep);

        SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(this);
        timerLength = Integer.parseInt(settings.getString("timer_length", "25")) * ONE_MINUTE;
        countDownTimer = timerLength + 10;

        if (isOnline()) {
            setContentView(R.layout.activity_main);

            ListView viewExercises = findViewById(R.id.exercises);
            viewExercises.setOnItemClickListener(this);
            viewExercises.setOnItemLongClickListener(this);


            adapter = new ExerciseAdapter(this);
            viewExercises.setAdapter(adapter);
            new RetrieveDataTask(exercises, adapter, getApplicationContext(), this).execute();
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

    private void runThread() {
        new Thread() {
            @Override
            public void run() {
                while (running) {
                    try {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                updateTimerText();
                            }
                        });
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        Log.e(TAG, e.getMessage());
                    }
                }
            }
        }.start();
    }

    private void updateTimerText() {
        
        TextView timer = findViewById(R.id.txtTimer);

        if (countDownTimer >= 0)
            timer.setText(String.format("%02d:%02d", countDownTimer / ONE_MINUTE, countDownTimer % ONE_MINUTE));
        else
            timer.setText(String.format("-%02d:%02d", -(countDownTimer / ONE_MINUTE), -(countDownTimer % ONE_MINUTE)));

        countDownTimer--;

        if ((countDownTimer == (timerLength) + 2 || countDownTimer == (timerLength) + 1 || countDownTimer == (timerLength)) || (countDownTimer == 2 || countDownTimer == 1 || countDownTimer == 0))
            tmrRun.start();
        if ((countDownTimer == ONE_MINUTE - 1) || (countDownTimer < 0 && countDownTimer % ONE_MINUTE == 0))
            tmrHurry.start();
        if (countDownTimer == (timerLength) - 1 || countDownTimer == -1)
            tmrStart.start();
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

    public void onExitClick(View button) {
        Log.i(TAG, String.format("Click on %s", button.getId()));
        System.exit(0);
    }

    @Override
    public void onBackPressed() {
        //Do nothing!
    }

    public void onStartClick(View view) {
        ImageButton button = (ImageButton) view;
        Log.i(TAG, String.format("Click on %s", button.getId()));

        if(running) {
            running = false;
            button.setImageResource(R.drawable.ic_access_alarms);
        }
        else {
            running = true;
            runThread();
            button.setImageResource(android.R.drawable.ic_media_pause);
        }

        btnTimer.start();
    }
}
