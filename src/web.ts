import { WebPlugin } from '@capacitor/core';
import { UserDefaultPlugin } from './definitions';

export class UserDefaultWeb extends WebPlugin implements UserDefaultPlugin {
  constructor() {
    super({
      name: 'UserDefault',
      platforms: ['web'],
    });
  }

  getByKey({ key }: { key: string }): Promise<{ value: string }> {
    const storage: Record<string, any> =
      typeof window === 'object' ? window : global;

    const value = (storage ? storage[key] : null) || null;

    return Promise.resolve({ value });
  }
}

const UserDefault = new UserDefaultWeb();

export { UserDefault };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(UserDefault);
