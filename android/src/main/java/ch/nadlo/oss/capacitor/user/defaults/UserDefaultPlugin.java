package ch.nadlo.oss.capacitor.user.defaults;

import android.content.Context;
import android.content.RestrictionsManager;
import android.os.Bundle;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "UserDefault")
public class UserDefaultPlugin extends Plugin {
    private final UserDefault implementation = new UserDefault();

    @Override
    protected void handleOnResume() {
        super.handleOnResume();

        RestrictionsManager myRestrictionsMgr =
                (RestrictionsManager) getContext().getSystemService(Context.RESTRICTIONS_SERVICE);

        Bundle appRestrictions = myRestrictionsMgr.getApplicationRestrictions();

        implementation.setAppRestrictions(appRestrictions);
    }

    @PluginMethod
    public void getByKey(PluginCall call) {
        String key = call.getString("key");

        JSObject ret = new JSObject();

        ret.put("value", implementation.readValue(key));
        ret.put("dict", implementation.appRestrictions);

        call.resolve(ret);
    }
}
