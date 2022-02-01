export interface UserDefaultPlugin {
  getByKey(params: { key: string }): Promise<{ value: string }>;
}
