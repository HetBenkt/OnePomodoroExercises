package nl.bos.onepomodoroexercises;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class ExerciseAdapter extends BaseAdapter {

    private final Context context;
    private static LayoutInflater inflater = null;
    private String[] data;

    public ExerciseAdapter(Context context, String[] data) {
        this.context = context;
        this.data = data;
        inflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return data.length;
    }

    @Override
    public Object getItem(int position) {
        return data[position];
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
        TextView text = (TextView) vi.findViewById(R.id.subtext);
        text.setText(data[position]);
        return vi;
    }

    public void updateResults(String[] results) {
        data = results;
        //Triggers the list update
        notifyDataSetChanged();
    }
}
