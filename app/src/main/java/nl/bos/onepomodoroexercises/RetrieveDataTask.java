package nl.bos.onepomodoroexercises;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Build;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.Toast;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import nl.bos.onepomodoroexercises.models.Data;
import nl.bos.onepomodoroexercises.models.Day;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.MessageFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class RetrieveDataTask extends AsyncTask<String, Void, JsonObject> {
    private final static String LOG_TAG = "RetrieveDataTask";
    private ArrayList<Exercise> exercises;
    private ArrayAdapter adapter;
    private Context context;

    public RetrieveDataTask(ArrayList<Exercise> exercises, ArrayAdapter adapter, Context context) {
        this.exercises = exercises;
        this.adapter = adapter;
        this.context = context;
    }

    @Override
    protected JsonObject doInBackground(String... urls) {
        JsonObject result = null;
        BufferedReader in = null;
        try {
            URL json = new URL(urls[0]);
            in = new BufferedReader(
                    new InputStreamReader(json.openStream()));

            String jsonString = in.lines().collect(Collectors.joining());
            result = new JsonParser().parse(jsonString).getAsJsonObject();
            Log.i(LOG_TAG, String.valueOf(result));
            in.close();
        } catch (java.io.IOException e) {
            Log.e(LOG_TAG, e.getMessage());
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    Log.e(LOG_TAG, e.getMessage());
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    @TargetApi(Build.VERSION_CODES.O)
    @Override
    protected void onPostExecute(JsonObject jsonData) {
        super.onPostExecute(jsonData);
        Gson gson = new GsonBuilder().create();
        Data data = gson.fromJson(jsonData, Data.class);

        LocalDate today = LocalDate.now();
        Log.i(LOG_TAG, String.valueOf(today));

        Day currentDay = data.getCurrentDay(today);

        if(currentDay != null) {
            List<Integer> exercises = currentDay.getExercises();
            for (int exerciseId: exercises) {
                Exercise exercise = data.getExercise(exerciseId);
                if(exercise != null) {
                    this.exercises.add(exercise);
                } else {
                    Toast toast = Toast.makeText(context, MessageFormat.format("Exercise id {0} for current day {1} not found in data!", exerciseId, today), Toast.LENGTH_SHORT);
                    toast.show();
                }
            }
            adapter.notifyDataSetChanged();
        }
        else {
            Toast toast = Toast.makeText(context, MessageFormat.format("Current day {0} not found in data!", today), Toast.LENGTH_SHORT);
            toast.show();
        }
    }
}
