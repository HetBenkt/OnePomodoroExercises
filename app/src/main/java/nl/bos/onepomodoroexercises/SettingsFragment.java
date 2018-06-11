package nl.bos.onepomodoroexercises;

import android.os.Bundle;
import android.preference.PreferenceFragment;
import nl.bos.onepomodoroexercises.preferences.DatePreference;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SettingsFragment extends PreferenceFragment {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load the preferences from an XML resource
        addPreferencesFromResource(R.xml.preferences);

        Date today = new Date();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-M-d");
        final DatePreference dp= (DatePreference) findPreference("selected_date");
        dp.setText(dateFormatter.format(today));
    }
}
