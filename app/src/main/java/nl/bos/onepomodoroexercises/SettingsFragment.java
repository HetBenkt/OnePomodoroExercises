package nl.bos.onepomodoroexercises;

import android.os.Bundle;
import android.preference.EditTextPreference;
import android.preference.PreferenceFragment;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SettingsFragment extends PreferenceFragment {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load the preferences from an XML resource
        addPreferencesFromResource(R.xml.preferences);

        Date today = new Date();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yy");
        EditTextPreference textPreference = (EditTextPreference) findPreference("edit_text_date");
        textPreference.setText(dateFormatter.format(today));
    }
}
