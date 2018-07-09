package nl.bos.onepomodoroexercises;

import android.util.Log;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.sql.*;

import static nl.bos.onepomodoroexercises.ICredentials.*;

public class Database {
    private static final String TAG = Database.class.getSimpleName();
    private Connection conn;
    private Statement statement;
    private static Database db;

    private Database() {
        String url = "jdbc:postgresql://%s:5432/%s";
        String driver = "org.postgresql.Driver";

        try {
            Class.forName(driver).newInstance();
            this.conn = DriverManager.getConnection(String.format(url, DB_HOST, DB_NAME), DB_USERNAME, DB_PASSKEY);
        } catch (Exception sqle) {
            Log.e(TAG, sqle.getMessage());
        }
    }

    /**
     * @return MysqlConnect Database connection object
     */
    public static synchronized Database getDbCon() {
        if (db == null) {
            db = new Database();
        }
        return db;

    }

    /**
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException {
        statement = db.conn.createStatement();
        return statement.executeQuery(query);
    }

    /**
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException
     * @desc Method to insert data to a table
     */
    public int insert(String insertQuery) throws SQLException {
        statement = db.conn.createStatement();
        return statement.executeUpdate(insertQuery);
    }

    public JsonArray getDays() {
        JsonArray days = new JsonArray();
        try {
            ResultSet rsDays = query("select * from days");
            while (rsDays.next()) {
                JsonElement day = new JsonObject();
                ((JsonObject) day).addProperty("id", rsDays.getInt(1));
                ((JsonObject) day).addProperty("title", rsDays.getString(2));
                ((JsonObject) day).addProperty("description", rsDays.getString(3));
                ((JsonObject) day).addProperty("date", rsDays.getString(4));
                Array exerciseIdArray = rsDays.getArray(5);
                Integer[] exerciseIds = (Integer[]) exerciseIdArray.getArray();
                JsonArray exercises = new JsonArray();
                for (int exerciseId : exerciseIds) {
                    exercises.add(exerciseId);
                }
                ((JsonObject) day).add("exercises", exercises);
                days.add(day);
            }
            rsDays.close();
        } catch (SQLException e) {
            Log.e(TAG, e.getMessage());
        }
        return days;
    }

    public JsonArray getExercises() {
        JsonArray exercises = new JsonArray();
        try {
            ResultSet rsExercises = query("select * from exercises");
            while (rsExercises.next()) {
                JsonElement day = new JsonObject();
                ((JsonObject) day).addProperty("id", rsExercises.getInt(1));
                ((JsonObject) day).addProperty("excelrow", rsExercises.getInt(2));
                ((JsonObject) day).addProperty("name", rsExercises.getString(3));
                ((JsonObject) day).addProperty("description", rsExercises.getString(4));
                ((JsonObject) day).addProperty("image", rsExercises.getString(5));
                ((JsonObject) day).addProperty("weight", rsExercises.getInt(6));
                ((JsonObject) day).addProperty("category", rsExercises.getString(7));
                ((JsonObject) day).addProperty("sets", rsExercises.getInt(8));
                ((JsonObject) day).addProperty("reps", rsExercises.getInt(9));
                ((JsonObject) day).addProperty("units", rsExercises.getString(10));
                exercises.add(day);
            }
            rsExercises.close();
        } catch (SQLException e) {
            Log.e(TAG, e.getMessage());
        }
        return exercises;
    }
}
