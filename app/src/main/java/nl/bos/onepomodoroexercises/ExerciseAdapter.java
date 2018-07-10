package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import nl.bos.onepomodoroexercises.models.Exercise;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

class ExerciseAdapter extends BaseAdapter {
    private static final String TAG = ExerciseAdapter.class.getSimpleName();

    private final LayoutInflater inflater;
    private List<Exercise> exercises = new ArrayList<>();
    private Context context;

    ExerciseAdapter(Context context) {
        inflater = LayoutInflater.from(context);
        this.context = context;
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

        ImageView icon = view.findViewById(R.id.icon);
        try {
            InputStream ims = context.getAssets().open(exercise.getImage().trim());
            Drawable d = Drawable.createFromStream(ims, null);
            icon.setImageDrawable(d);
        } catch (IOException e) {
            Log.e(TAG, e.getMessage());
        }

        TextView category = view.findViewById(R.id.category);
        setColorForCategory(category, exercise.getCategory().trim());

        TextView weight = view.findViewById(R.id.weight);
        setColorForWeight(weight, exercise.getWeight());


        TextView header = view.findViewById(R.id.header);
        header.setText(String.format("%s", exercise.getName()));
        if (exercise.isDone())
            header.setBackgroundResource(R.color.rowBackgroundDone);
        else
            header.setBackgroundResource(R.color.rowBackgroundToDo);

        TextView subtext = view.findViewById(R.id.subtext);
        subtext.setText(String.format("%d x %d %s", exercise.getSets(), exercise.getReps(), exercise.getUnits()));
        if (exercise.isDone())
            subtext.setBackgroundResource(R.color.rowBackgroundDone);
        else
            subtext.setBackgroundResource(R.color.rowBackgroundToDo);

        TextView description = view.findViewById(R.id.description);
        description.setText(exercise.getDescription());
        if (exercise.isDone())
            description.setBackgroundResource(R.color.rowBackgroundDone);
        else
            description.setBackgroundResource(R.color.rowBackgroundToDo);

        return view;
    }

    private void setColorForWeight(TextView textView, int weight1) {
        switch (weight1) {
            case 0:
                textView.setBackgroundResource(R.color.rowWeight0);
                break;
            case 1:
                textView.setBackgroundResource(R.color.rowWeight1);
                break;
            case 2:
                textView.setBackgroundResource(R.color.rowWeight2);
                break;
            case 3:
                textView.setBackgroundResource(R.color.rowWeight3);
                break;
            default:
                textView.setBackgroundResource(R.color.mainText);
                break;
        }
    }

    private void setColorForCategory(TextView textView, String category) {
        switch (category) {
            case "FREE":
                textView.setBackgroundResource(R.color.rowCategoryFree);
                break;
            case "WARMING-UP":
                textView.setBackgroundResource(R.color.rowCategoryWarmingUp);
                break;
            case "COOLING-DOWN":
                textView.setBackgroundResource(R.color.rowCategoryCoolingDown);
                break;
            case "30 days":
                textView.setBackgroundResource(R.color.rowCategory30Days);
                break;
            case "Dumbbells":
                textView.setBackgroundResource(R.color.rowCategoryDumbbells);
                break;
            default:
                textView.setBackgroundResource(R.color.mainText);
                break;
        }
    }

    void updateResults(List<Exercise> exercises) {
        this.exercises = exercises;
        notifyDataSetChanged();
    }
}
