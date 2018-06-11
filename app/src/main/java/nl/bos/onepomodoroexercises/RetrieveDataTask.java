package nl.bos.onepomodoroexercises;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import nl.bos.onepomodoroexercises.models.Data;
import nl.bos.onepomodoroexercises.models.Day;
import nl.bos.onepomodoroexercises.models.Exercise;
import nl.bos.onepomodoroexercises.preferences.DatePreference;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

class RetrieveDataTask extends AsyncTask<String, Void, JsonObject> {
    private final static String LOG_TAG = "RetrieveDataTask";
    private final List<Exercise> exercises;
    private final ExerciseAdapter adapter;
    private final Context context;
    private final Activity activity;

    public RetrieveDataTask(List<Exercise> exercises, ExerciseAdapter adapter, Context context, Activity activity) {
        this.exercises = exercises;
        this.adapter = adapter;
        this.context = context;
        this.activity = activity;
    }

    @Override
    protected JsonObject doInBackground(String... urls) {
        JsonObject result = null;
        BufferedReader in = null;
        try {
            URL json = new URL(urls[0]);
            in = new BufferedReader(
                    new InputStreamReader(json.openStream()));

            StringBuilder jsonString = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                jsonString.append(line);
            }
            result = new JsonParser().parse(jsonString.toString()).getAsJsonObject();
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

    @Override
    protected void onPostExecute(JsonObject jsonData) {
        super.onPostExecute(jsonData);
        Gson gson = new GsonBuilder().create();
        Data data = gson.fromJson(jsonData, Data.class);

        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(context);
        String dateToday = sharedPref.getString("selected_date", "");
        Log.i(LOG_TAG, dateToday);

        if (data != null) {

            Day currentDay = data.getCurrentDay(dateToday);

            if (currentDay != null) {
                //Day info
                TextView dayTitle = activity.findViewById(R.id.txtDayTitle);
                dayTitle.setText(currentDay.getTitle());
                TextView dayDescription = activity.findViewById(R.id.txtDayDescription);
                dayDescription.setText(currentDay.getDescription());

                SimpleDateFormat dateFormatter = new SimpleDateFormat("dd MMM yyyy");
                DateFormat df = new SimpleDateFormat("yyyy-M-d");
                try {
                    Date startDate = df.parse(currentDay.getDate());
                    TextView dayDate = activity.findViewById(R.id.txtDayDate);
                    dayDate.setText(dateFormatter.format(startDate));
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                //Exercises info
                List<Integer> exerciseIds = currentDay.getExercises();
                for (int exerciseId : exerciseIds) {
                    Exercise exercise = data.getExercise(exerciseId);
                    if (exercise != null) {
                        exercises.add(exercise);
                    } else {
                        Toast toast = Toast.makeText(context, MessageFormat.format("Exercise id {0} for current day {1} not found in data!", exerciseId, dateToday), Toast.LENGTH_LONG);
                        toast.show();
                    }
                }
                adapter.updateResults(exercises);
                TextView done = activity.findViewById(R.id.txtDone);
                done.setText(String.format("%d/%d", 0, exerciseIds.size()));
            } else {
                Toast toast = Toast.makeText(context, MessageFormat.format("Current day {0} not found in data!", dateToday), Toast.LENGTH_LONG);
                toast.show();
            }
        } else {
            Toast toast = Toast.makeText(context, "No data found!", Toast.LENGTH_LONG);
            toast.show();
        }
    }
}
