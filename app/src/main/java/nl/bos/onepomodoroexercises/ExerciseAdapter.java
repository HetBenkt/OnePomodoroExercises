package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;

class ExerciseAdapter extends BaseAdapter {

    private final LayoutInflater inflater;
    private List<Exercise> exercises = new ArrayList<>();

    ExerciseAdapter(Context context) {
        inflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return exercises.size();
    }

    @Override
    public Object getItem(int position) {
        return exercises.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }


    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {
        if (view == null)
            view = inflater.inflate(R.layout.row, null);

        Exercise exercise = exercises.get(position);

        TextView header = view.findViewById(R.id.header);
        header.setText(String.format("%s", exercise.getName()));
        if (exercise.isDone())
            header.setBackgroundResource(R.color.rowBackgroundDone);
        else
            header.setBackgroundResource(R.color.rowBackgroundToDo);

        TextView subtext = view.findViewById(R.id.subtext);
        subtext.setText(String.format("%d %s", exercise.getDuration(), exercise.getSteps()));
        if (exercise.isDone())
            subtext.setBackgroundResource(R.color.rowBackgroundDone);
        else
            subtext.setBackgroundResource(R.color.rowBackgroundToDo);

        return view;
    }


    void updateResults(List<Exercise> exercises) {
        this.exercises = exercises;
        notifyDataSetChanged();
    }
}
