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

    private static LayoutInflater inflater = null;
    private List<Exercise> exercises = new ArrayList<>();

    public ExerciseAdapter(Context context) {
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
        View vi = view;
        if (vi == null)
            vi = inflater.inflate(R.layout.row, null);

        TextView header = vi.findViewById(R.id.header);
        header.setText(exercises.get(position).getName());

        TextView subtext = vi.findViewById(R.id.subtext);
        subtext.setText(exercises.get(position).getDescription());

        return vi;
    }


    public void updateResults(List<Exercise> exercises) {
        this.exercises = exercises;
        notifyDataSetChanged();
    }
}
