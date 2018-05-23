package nl.bos.onepomodoroexercises;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;

public class MainActivity extends Activity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener {

    private static final String LOG_TAG = "MainActivity";
    private ArrayList<Exercise> exercises = new ArrayList<>();
    private ArrayAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(LOG_TAG, "onCreate...");
        setContentView(R.layout.activity_main);

        ListView viewExercises = findViewById(R.id.exercises);
        viewExercises.setOnItemClickListener(this);
        viewExercises.setOnItemLongClickListener(this);

        adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, exercises);
        viewExercises.setAdapter(adapter);
        new RetrieveDataTask(exercises, adapter, getApplicationContext()).execute("https://drive.google.com/uc?id=1ObJ5KUPpppQWakof-Bym4MEdX_r4LpSB&export=download");
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(LOG_TAG, "click" + id);
    }

    @Override
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int position, long id) {
        Log.i(LOG_TAG, "long click" + id);
        exercises.remove(exercises.get(position));
        adapter.notifyDataSetChanged();
        return false;
    }
}
