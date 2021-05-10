declare module '@capacitor/core' {
  interface PluginRegistry {
    UserDefault: UserDefaultPlugin;
  }
}

export interface UserDefaultPlugin {
  getByKey(params: { key: string }): Promise<{ value: string }>;
}
