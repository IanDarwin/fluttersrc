package com.darwinsys.expenses;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.LayoutInflater;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.platform.PlatformView;
import java.util.Map;

class NativeView implements PlatformView {
    private final static String TAG = "Expenses NativeView";
    @NonNull private final View mainView;

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        mainView = LayoutInflater.from(context).inflate(R.layout.activity_expense_entry, null);
        Activity ant = (Activity)mainView.getContext();
        TextView date = mainView.findViewById(R.id.expEdt_et_date);
        date.setText(creationParams.get("expenseDate").toString());
        TextView descr = mainView.findViewById(R.id.expEdt_et_description);
        descr.setText(creationParams.get("description").toString());
        TextView amount = mainView.findViewById(R.id.expEdt_et_amount);
        amount.setText(creationParams.get("amount").toString());
        ImageButton image = mainView.findViewById(R.id.expEdt_ib_receipt);
        image.setOnClickListener(v -> {
            Log.d(TAG, "Would take a Picture now");
        });
        Button save = mainView.findViewById(R.id.expEdt_bt_save);
        save.setOnClickListener(v -> {
            Log.d(TAG, "Would save your work now");
        });
    }

    @NonNull
    @Override
    public View getView() {
        return mainView;
    }

    @Override
    public void dispose() {
        // Needed but nothing to do
    }
}