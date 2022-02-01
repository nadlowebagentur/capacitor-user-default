import { registerPlugin } from '@capacitor/core';

import type { UserDefaultPlugin } from './definitions';

const UserDefault = registerPlugin<UserDefaultPlugin>('UserDefault', {
  web: () => import('./web').then(m => new m.UserDefaultWeb()),
});

export * from './definitions';
export { UserDefault };
