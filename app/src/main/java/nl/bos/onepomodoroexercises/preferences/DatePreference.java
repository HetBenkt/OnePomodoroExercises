package nl.bos.onepomodoroexercises.preferences;

import android.content.Context;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.DatePicker;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DatePreference extends DialogPreference {

    private int lastDate = 0;
    private int lastMonth = 0;
    private int lastYear = 0;
    private String dateval;
    private DatePicker picker = null;

    public DatePreference(Context context, AttributeSet attrs) {
        super(context, attrs);

        setPositiveButtonText("Set");
        setNegativeButtonText("Cancel");
    }

    public static int getYear(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[0]));
    }

    public static int getMonth(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[1]));
    }

    public static int getDay(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[2]));
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);

        if (positiveResult) {
            lastYear = picker.getYear();
            lastMonth = picker.getMonth()+1;
            lastDate = picker.getDayOfMonth();

            String dateval = String.valueOf(lastYear) + "-"
                    + String.valueOf(lastMonth) + "-"
                    + String.valueOf(lastDate);

            if (callChangeListener(dateval)) {
                persistString(dateval);
            }
        }
    }

    @Override
    protected View onCreateDialogView() {
        picker = new DatePicker(getContext());
        return (picker);
    }

    @Override
    protected void onBindDialogView(View v) {
        super.onBindDialogView(v);
        picker.updateDate(lastYear, lastMonth-1, lastDate);
    }

    @Override
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        dateval = null;

        if (restoreValue) {
            if (defaultValue == null) {
                Calendar cal = Calendar.getInstance();
                SimpleDateFormat format1 = new SimpleDateFormat("yyyy-M-d");
                String formatted = format1.format(cal.getTime());
                dateval = getPersistedString(formatted);
            } else {
                dateval = getPersistedString(defaultValue.toString());
            }
        } else {
            dateval = defaultValue.toString();
        }
        lastYear = getYear(dateval);
        lastMonth = getMonth(dateval);
        lastDate = getDay(dateval);
    }

    public void setText(String text) {
        final boolean wasBlocking = shouldDisableDependents();

        dateval = text;

        persistString(text);

        final boolean isBlocking = shouldDisableDependents();
        if (isBlocking != wasBlocking) {
            notifyDependencyChange(isBlocking);
        }
    }

    public String getText() {
        return dateval;
    }
}
