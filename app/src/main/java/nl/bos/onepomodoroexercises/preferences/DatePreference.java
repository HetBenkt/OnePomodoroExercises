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
    private String dateValidate;
    private DatePicker picker = null;

    public DatePreference(Context context, AttributeSet attrs) {
        super(context, attrs);

        setPositiveButtonText("Set");
        setNegativeButtonText("Cancel");
    }

    private static int getYear(String dateValidate) {
        String[] pieces = dateValidate.split("-");
        return (Integer.parseInt(pieces[0]));
    }

    private static int getMonth(String dateValidate) {
        String[] pieces = dateValidate.split("-");
        return (Integer.parseInt(pieces[1]));
    }

    private static int getDay(String dateValidate) {
        String[] pieces = dateValidate.split("-");
        return (Integer.parseInt(pieces[2]));
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);

        if (positiveResult) {
            lastYear = picker.getYear();
            lastMonth = picker.getMonth()+1;
            lastDate = picker.getDayOfMonth();

            StringBuilder date = new StringBuilder();
            date.append(lastYear).append("-").append(lastMonth).append("-").append(lastDate);

            if (callChangeListener(date)) {
                persistString(date.toString());
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
        dateValidate = null;

        if (restoreValue) {
            if (defaultValue == null) {
                Calendar cal = Calendar.getInstance();
                SimpleDateFormat format1 = new SimpleDateFormat("yyyy-M-d");
                String formatted = format1.format(cal.getTime());
                dateValidate = getPersistedString(formatted);
            } else {
                dateValidate = getPersistedString(defaultValue.toString());
            }
        } else {
            dateValidate = defaultValue.toString();
        }
        lastYear = getYear(dateValidate);
        lastMonth = getMonth(dateValidate);
        lastDate = getDay(dateValidate);
    }

    public void setText(String text) {
        final boolean wasBlocking = shouldDisableDependents();

        dateValidate = text;

        persistString(text);

        final boolean isBlocking = shouldDisableDependents();
        if (isBlocking != wasBlocking) {
            notifyDependencyChange(isBlocking);
        }
    }
}
