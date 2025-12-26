local aria2 = import 'lib/aria2.libsonnet';
local trackers = import 'trackers.json';
local secret = std.extVar('ARIA2_SECRET');
local user_agent = std.extVar('ARIA2_USER_AGENT');
local aria2_home = std.extVar("ARIA2_HOME");
local sessions_dir = aria2_home + "/sessions";
local dht_storage_dir = aria2_home + "/data";
{
  ["aria2.conf"]: aria2.manifest(aria2.CoreConfig() + 
        aria2.LogConfig() +
        aria2.FileAllocConfig() +
        aria2.SessionsConfig(sessions_dir) + 
        aria2.RpcConfig(secret) + 
        aria2.HttpConfig(user_agent) +
        aria2.SplitConfig() +
        aria2.TorrentConfig() +
        aria2.TransmissionPeerConfig() +
        aria2.DhtConfig(dht_storage_dir) +
        aria2.Dht6Config(dht_storage_dir) +
        aria2.TorrentTrackers(trackers)),
}
