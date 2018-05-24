package nl.bos.onepomodoroexercises.models;

import java.util.List;

@lombok.Data
public class Data {
    private String APP_NAME;
    private List<Day> days;
    private List<Exercise> exercises;

    public Day getCurrentDay(String today) {
        for (Day day: days) {
            if(day.getDate().equals(today))
                return day;
        }
        return null;
    }

    public Exercise getExercise(int exerciseId) {
        for (Exercise exercise: exercises) {
            if(exercise.getId() == exerciseId)
                return exercise;
        }
        return null;
    }
}
