package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.util.ArrayList;
import java.util.List;

class ExerciseAdapter extends BaseAdapter {

    private LayoutInflater inflater;
    private List<Exercise> exercises = new ArrayList<>();

    protected ExerciseAdapter(Context context) {
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
        header.setText(String.format("%d. %s",exercise.getId(), exercise.getName()));
        if (exercise.isDone())
            header.setBackgroundColor(Color.parseColor("#4ABDAC"));
        else
            header.setBackgroundColor(Color.parseColor("#F7B733"));

        TextView subtext = view.findViewById(R.id.subtext);
        subtext.setText(String.format("Cat: %d -> %d %s", exercise.getCategory(), exercise.getDuration(), exercise.getDuration_steps()));
        if (exercise.isDone())
            subtext.setBackgroundColor(Color.parseColor("#4ABDAC"));
        else
            subtext.setBackgroundColor(Color.parseColor("#F7B733"));

        return view;
    }


    protected void updateResults(List<Exercise> exercises) {
        this.exercises = exercises;
        notifyDataSetChanged();
    }
}
