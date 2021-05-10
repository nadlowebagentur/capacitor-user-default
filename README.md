# @nadlowebagentur/capacitor-user-default

Plugin that can read IOS NSUserDefaults config which is sent from the MDM system.

## Install

```bash
npm install @nadlowebagentur/capacitor-user-default
npx cap sync
```

## iOS

For being able to use MDM config device should be connected to the existing MDM and system should be able to send config payload like this.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>appServerURL</key>
	<string>http://developer.apple.com/</string>
</dict>
</plist>
```

## Android

Not supported yet.

## Example

Please, take a look at the [example](./example) folder for more demo.

```typescript
import {Plugins} from '@capacitor/core';
import 'capacitor-user-default';

// access to the plugin
const { UserDefault } = Plugins;

UserDefault.getByKey({ key: 'appServerURL' }).then(({ value }: any) => {
  console.log({ value });
});
```
