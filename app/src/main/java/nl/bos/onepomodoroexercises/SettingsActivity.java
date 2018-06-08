package nl.bos.onepomodoroexercises;

import android.os.Bundle;
import android.preference.EditTextPreference;
import android.support.v7.app.ActionBar;
import android.util.Log;
import android.view.MenuItem;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SettingsActivity extends AppCompatPreferenceActivity {
    private static final String TAG = SettingsActivity.class.getSimpleName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "onCreate...");

        ActionBar actionBar = getSupportActionBar();
        if ( actionBar != null ) {
            // Show the Up button in the action bar.
            actionBar.setDisplayHomeAsUpEnabled( true );
            actionBar.setHomeButtonEnabled( true );
        }

        // Display the fragment as the main content.
        getFragmentManager().beginTransaction()
                .replace(android.R.id.content, new SettingsFragment())
                .commit();
        getListView().setBackgroundResource(R.color.mainBackgroud);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
