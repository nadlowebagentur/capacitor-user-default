import { WebPlugin } from '@capacitor/core';

import type { UserDefaultPlugin } from './definitions';

export class UserDefaultWeb extends WebPlugin implements UserDefaultPlugin {
  getByKey({ key }: { key: string }): Promise<{ value: string }> {
    const storage: Record<string, any> =
      typeof window === 'object' ? window : global;

    const value = (storage ? storage[key] : null) || null;

    return Promise.resolve({ value });
  }
}
