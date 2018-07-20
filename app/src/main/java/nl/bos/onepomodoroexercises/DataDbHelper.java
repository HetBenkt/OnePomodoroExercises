package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class DataDbHelper extends SQLiteOpenHelper {
    private static final String TAG = Database.class.getSimpleName();

    public static final int DATABASE_VERSION = 2;
    public static final String DATABASE_NAME = "Data.db";
    private static final String[] SQL_DELETE_ENTRIES = {"DROP TABLE IF EXISTS days;", "DROP TABLE IF EXISTS exercises;"};
    private static final String[] SQL_CREATE_ENTRIES = {"CREATE TABLE exercises (\n" +
            "  id              SERIAL    PRIMARY KEY UNIQUE,\n" +
            "  excelrow        INT                           NOT NULL,\n" +
            "  name            CHAR(32)                      NOT NULL,\n" +
            "  description     CHAR(256)                     NOT NULL,\n" +
            "  image           CHAR(256)                     NOT NULL,\n" +
            "  weight          INT                           NOT NULL,\n" +
            "  category        CHAR(16)                      NOT NULL,\n" +
            "  sets            INT                           NOT NULL,\n" +
            "  reps            INT                           NOT NULL,\n" +
            "  units           CHAR(8)                       NOT NULL\n" +
            ");", "CREATE TABLE days (\n" +
            "  id              SERIAL    PRIMARY KEY UNIQUE,\n" +
            "  title           CHAR(32)                      NOT NULL,\n" +
            "  description     CHAR(256)                     NOT NULL,\n" +
            "  date            CHAR(16)                      NOT NULL,\n" +
            "  exercises       INT[]                         NOT NULL\n" +
            ");"};

    public DataDbHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        for (String entry: SQL_CREATE_ENTRIES) {
            db.execSQL(entry);
        }
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        for (String entry: SQL_DELETE_ENTRIES) {
            db.execSQL(entry);
        }
        onCreate(db);
    }

    @Override
    public void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        onUpgrade(db, oldVersion, newVersion);
    }

    public JsonArray getDays(SQLiteDatabase db) {
        JsonArray days = new JsonArray();
        Cursor rsDays = db.rawQuery("select * from days", null);

        while (rsDays.moveToNext()) {
            JsonElement day = new JsonObject();
            ((JsonObject) day).addProperty("id", rsDays.getInt(0));
            ((JsonObject) day).addProperty("title", rsDays.getString(1));
            ((JsonObject) day).addProperty("description", rsDays.getString(2));
            ((JsonObject) day).addProperty("date", rsDays.getString(3));
            String exerciseIdArray = rsDays.getString(4);
            exerciseIdArray = exerciseIdArray.substring(1, exerciseIdArray.length()-1);

            String[] exerciseIds = exerciseIdArray.split(",");
            JsonArray exercises = new JsonArray();
            for (String exerciseId : exerciseIds) {
                exercises.add(exerciseId);
            }
            ((JsonObject) day).add("exercises", exercises);
            days.add(day);
        }
        rsDays.close();
        return days;
    }

    public JsonArray getExercises(SQLiteDatabase db) {
        JsonArray exercises = new JsonArray();
        Cursor rsExercises = db.rawQuery("select * from exercises", null);
        while (rsExercises.moveToNext()) {
            JsonElement exercise = new JsonObject();
            ((JsonObject) exercise).addProperty("id", rsExercises.getInt(0));
            ((JsonObject) exercise).addProperty("excelrow", rsExercises.getInt(1));
            ((JsonObject) exercise).addProperty("name", rsExercises.getString(2));
            ((JsonObject) exercise).addProperty("description", rsExercises.getString(3));
            ((JsonObject) exercise).addProperty("image", rsExercises.getString(4));
            ((JsonObject) exercise).addProperty("weight", rsExercises.getInt(5));
            ((JsonObject) exercise).addProperty("category", rsExercises.getString(6));
            ((JsonObject) exercise).addProperty("sets", rsExercises.getInt(7));
            ((JsonObject) exercise).addProperty("reps", rsExercises.getInt(8));
            ((JsonObject) exercise).addProperty("units", rsExercises.getString(9));
            exercises.add(exercise);
        }
        rsExercises.close();
        return exercises;
    }
}
