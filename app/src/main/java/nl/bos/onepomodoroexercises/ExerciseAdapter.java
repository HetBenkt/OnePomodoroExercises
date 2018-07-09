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
            InputStream ims = context.getAssets().open("td_action_img/" + getExerciseIconName(exercise) + "/icon.png");
            Drawable d = Drawable.createFromStream(ims, null);
            icon.setImageDrawable(d);
        } catch (IOException e) {
            Log.e(TAG, e.getMessage());
        }

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

        TextView description = view.findViewById(R.id.description);
        description.setText(exercise.getDescription());
        if (exercise.isDone())
            description.setBackgroundResource(R.color.rowBackgroundDone);
        else
            description.setBackgroundResource(R.color.rowBackgroundToDo);

        return view;
    }

    private String getExerciseIconName(Exercise exercise) {
        String result = "";

        switch (exercise.getName().trim()) {
            case "Bird-dog":
                result = "bird_dog";
                break;
            case "Bridge":
                result = "bridge";
                break;
            case "Bridge butt":
                result = "butt_bridge";
                break;
            case "Burpees easy":
                result = "burpee";
                break;
            case "Crunches crossed-arms":
                result = "cross_arm_crunch";
                break;
            case "Crunches long-arms":
                result = "long_arm_crunch";
                break;
            case "Crunches reversed":
                result = "reverse_crunch";
                break;
            case "Donkeykick left/right":
                result = "donkey_kick_right";
                break;
            case "Firehydrant left/right":
                result = "fire_hydrant_right";
                break;
            case "High stepping":
                result = "high_knees";
                break;
            case "Jumping jacks":
                result = "jumping_jacks";
                break;
            case "Leglift side left/right":
                result = "side_leg_lift_right";
                break;
            case "Lunges":
                result = "lunge";
                break;
            case "Lunges cursty":
                result = "curtsy_lunge";
                break;
            case "Lunges kneehops left/right":
                result = "lunge_knee_hops_right";
                break;
            case "Plank":
                result = "plank";
                break;
            case "Plank side left/right":
                result = "right_side_plank";
                break;
            case "Plank straight-arms":
                result = "straight_arm_plank";
                break;
            case "Push-ups":
                result = "push_up";
                break;
            case "Push-ups decline":
                result = "decline_push_up";
                break;
            case "Push-ups incline":
                result = "incline_push_up";
                break;
            case "Push-ups knee":
                result = "knee_push_up";
                break;
            case "Russian twist":
                result = "russian_twist";
                break;
            case "Single calf raise left/right":
                result = "single_leg_calf_raise_right";
                break;
            case "Sit-ups":
                result = "sit_ups";
                break;
            case "Squats":
                result = "squat";
                break;
            case "Squats split left/right":
                result = "split_squat_right";
                break;
            case "Superman":
                result = "superman";
                break;
            case "Triceps with chair":
                result = "triceps_dip_on_chair";
                break;
            case "Wallclimbing":
                result = "mountain_climber";
                break;
            case "Wallsit":
                result = "wall_sit";
                break;
            default:
                result = "empty";
                break;
        }

        return result;
    }


    void updateResults(List<Exercise> exercises) {
        this.exercises = exercises;
        notifyDataSetChanged();
    }
}
