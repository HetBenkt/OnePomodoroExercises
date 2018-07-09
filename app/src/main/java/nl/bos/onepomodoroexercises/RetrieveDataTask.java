package nl.bos.onepomodoroexercises;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import nl.bos.onepomodoroexercises.models.Data;
import nl.bos.onepomodoroexercises.models.Day;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

class RetrieveDataTask extends AsyncTask<String, Void, JsonObject> {
    private static final String TAG = RetrieveDataTask.class.getSimpleName();

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
        Database dbCon = Database.getDbCon();

        JsonObject resultDB = new JsonObject();

        resultDB.addProperty("appName", "One Pomodoro Exercises");

        JsonArray daysResult = dbCon.getDays();
        resultDB.add("days", daysResult);

        JsonArray exercisesResult = dbCon.getExercises();
        resultDB.add("exercises", exercisesResult);

        return resultDB;
    }

    @Override
    protected void onPostExecute(JsonObject jsonData) {
        super.onPostExecute(jsonData);
        Gson gson = new GsonBuilder().create();
        Data data = gson.fromJson(jsonData, Data.class);

        String dateToday = getDateToday();
        Log.i(TAG, dateToday);

        if (data != null) {

            Day currentDay = data.getCurrentDay(dateToday);

            if (currentDay != null) {

                List<Integer> exerciseIds = currentDay.getExercises();

                handleDayInfo(currentDay);
                handleExercisesInfo(exerciseIds, data, dateToday);

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

    private void handleExercisesInfo(List<Integer> exerciseIds, Data data, String dateToday) {
        for (int exerciseId : exerciseIds) {
            Exercise exercise = data.getExercise(exerciseId);
            if (exercise != null) {
                exercises.add(exercise);
            } else {
                Toast toast = Toast.makeText(context, MessageFormat.format("Exercise id {0} for current day {1} not found in data!", exerciseId, dateToday), Toast.LENGTH_LONG);
                toast.show();
            }
        }
    }

    private void handleDayInfo(Day currentDay) {
        TextView dayTitle = activity.findViewById(R.id.txtDayTitle);
        dayTitle.setText(currentDay.getTitle().trim());
        TextView dayDescription = activity.findViewById(R.id.txtDayDescription);
        dayDescription.setText(currentDay.getDescription().trim());

        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd MMM yyyy");
        DateFormat df = new SimpleDateFormat("yyyy-M-d");
        try {
            Date startDate = df.parse(currentDay.getDate().trim());
            TextView dayDate = activity.findViewById(R.id.txtDayDate);
            dayDate.setText(dateFormatter.format(startDate));
        } catch (ParseException e) {
            Log.e(TAG, e.getMessage());
        }
    }

    private String getDateToday() {
        String result;
        String caller = activity.getIntent().getStringExtra("caller");
        Log.i(TAG, String.format("Caller is %s", caller));

        if (caller != null) {
            SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(context);
            result = sharedPref.getString("selected_date", "");
        } else {
            Date today = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
            result = sdf.format(today);
        }

        return result;
    }
}
