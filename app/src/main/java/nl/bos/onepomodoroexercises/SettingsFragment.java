package nl.bos.onepomodoroexercises;

import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.util.Log;

@SuppressWarnings("WeakerAccess")
public class SettingsFragment extends PreferenceFragment {
    private static final String TAG = SettingsActivity.class.getSimpleName();

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load the preferences from an XML resource
        addPreferencesFromResource(R.xml.preferences);

        PreferenceScreen prefScreen = getPreferenceScreen();
        for(int i=0; i < prefScreen.getPreferenceCount(); i++) {
            Preference pref = prefScreen.getPreference(i);
            setColorPreferencesSummary(pref);
        }

        Preference updateLocalData = findPreference(getString(R.string.updateLocalData));
        updateLocalData.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                Log.i(TAG, "Update database!");
                return true;
            }
        });
    }

    private void setColorPreferencesSummary(Preference pref) {
        CharSequence cs = (CharSequence) pref.getSummary();
        String plainTitle = cs.subSequence(0, cs.length()).toString();
        Spannable coloredSummary = new SpannableString(plainTitle);
        coloredSummary.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.rowBackgroundDone, null)), 0, coloredSummary.length(), 0);
        pref.setSummary(coloredSummary);
    }
}
