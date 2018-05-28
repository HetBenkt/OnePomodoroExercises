package nl.bos.onepomodoroexercises;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, View.OnClickListener, Runnable {

    private static final String LOG_TAG = "MainActivity";
    private final List<Exercise> exercises = new ArrayList<>();
    private ExerciseAdapter adapter;
    private TextView timer;
    private Button button;
    private Thread timerThread;
    private int countDownTimer = (25 * 60) + 10;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(LOG_TAG, "onCreate...");
        setContentView(R.layout.activity_main);

        ListView viewExercises = findViewById(R.id.exercises);
        viewExercises.setOnItemClickListener(this);
        viewExercises.setOnItemLongClickListener(this);

        button = findViewById(R.id.btnStart);
        button.setOnClickListener(this);

        timer = findViewById(R.id.txtTimer);
        timerThread = new Thread(this);

        adapter = new ExerciseAdapter(this);
        viewExercises.setAdapter(adapter);
        new RetrieveDataTask(exercises, adapter, getApplicationContext(), this).execute("https://drive.google.com/uc?id=1ObJ5KUPpppQWakof-Bym4MEdX_r4LpSB&export=download");
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(LOG_TAG, "click " + id);
        Exercise exercise = (Exercise) adapterView.getItemAtPosition(position);
        if (exercise.isDone())
            exercise.setDone(false);
        else
            exercise.setDone(true);
        adapter.updateResults(exercises);
    }

    @Override
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(LOG_TAG, "long click " + id);
        exercises.remove(position);
        adapter.updateResults(exercises);
        return false;
    }

    @Override
    public void onClick(View view) {
        Log.i(LOG_TAG, "Start click");
        timerThread.start();
        button.setEnabled(false);
        button.setBackgroundColor(Color.GRAY);
    }

    @Override
    public void run() {
        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable r = new Runnable() {
            public void run() {
                handler.postDelayed(this, 1000);
                timer.setText(String.format("%02d:%02d", countDownTimer / 60, countDownTimer % 60));
                countDownTimer--;
            }
        };
        handler.postDelayed(r, 0000);
    }
}
