package nl.bos.onepomodoroexercises;

import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.util.Log;

@SuppressWarnings("WeakerAccess")
public class SettingsFragment extends PreferenceFragment {
    private static final String TAG = SettingsActivity.class.getSimpleName();

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load the preferences from an XML resource
        addPreferencesFromResource(R.xml.preferences);

        Preference updateLocalData = findPreference(getString(R.string.updateLocalData));
        updateLocalData.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                Log.i(TAG, "Update database!");
                return true;
            }
        });

    }
}
