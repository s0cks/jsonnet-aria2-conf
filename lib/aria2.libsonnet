{
  FileAllocConfig(alloc = "falloc", limit = "8M", disk_cache="64M"):
    {
      ["file-allocation"]: alloc,
      ["no-file-allocation-limit"]: limit,
      ["disk-cache"]: disk_cache,
    },
  LogConfig(file = "-", level = "warn", console_level = "notice"):
    {
      ["console-log-level"]: console_level,
      ["log-level"]: level,
      ["log"]: file,
    },
  SessionsConfig(dir, interval = 60):
    {
      ["save-session"]: dir,
      ["save-session-interval"]: interval,
    },
  CoreConfig(dir = "$HOME/Downloads/", max_concurrent_downloads = 10):
    {
      dir: dir,
      continue: true,
      quiet: false,
      daemon: false,
      ["max-concurrent-downloads"]: max_concurrent_downloads,
      ["max-overall-download-limit"]: 0,
      ["max-download-limit"]: 0,
      ["allow-overwrite"]: true,
      ["allow-piece-length-change"]: true,
      ["always-resume"]: true,
      ["async-dns"]: true,
      ["auto-file-renaming"]: true,
      ["content-disposition-default-utf8"]: true,
    },
  DisabledRpcConfig():
    {
      ["enable-rpc"]: false,
    },
  RpcConfig(secret, port = 6800, allow_origin_all = true, listen_all = false, pause = false):
    {
      ["enable-rpc"]: true,
      "pause": pause,
      ["rpc-save-upload-metadata"]: true,
      ["rpc-allow-origin-all"]: allow_origin_all,
      ["rpc-listen-all"]: listen_all,
      ["rpc-listen-port"]: port,
      ["rpc-secret"]: secret,
    },
  RpcTlsConfig(cert, key):
    {
      ["rpc-secure"]: true,
      ["rpc-certificate"]: cert,
      ["rpc-private-key"]: key,
    },
  SecureRpcConfig(secret,  cert, key, port = 6800, allow_origin_all = true, listen_all = false, pause = false):
    $.RpcConfig(secret, port, allow_origin_all, listen_all, pause) +
    $.RpcTlsConfig(cert, key),
  HttpConfig(user_agent = "aria2/$VERSION", max_connections = 16):
    {
      ["user-agent"]: user_agent,
      ["max-connection-per-server"]: max_connections,
    },
  SplitConfig(split = "32", min_size = "8M"):
    {
      "split": split,
      ["min-split-size"]: min_size,
    },
  DhtConfig(storage, entry = "dht.transmissionbt.com:6881"):
    {
      ["enable-dht"]: true,
      ["dht-entry-point"]: entry,
      ["dht-file-path"]: storage + "/dht.dat",
    },
  Dht6Config(storage, entry = "dht.transmissionbt.com:6881"):
    {
      ["enable-dht6"]: true,
      ["dht-entry-point6"]: entry,
      ["dht-file-path6"]: storage + "/dht6.dat",
    },
  PeerConfig(agent, id_prefix):
    {
      ["peer-id-prefix"]: id_prefix,
      ["peer-agent"]: agent,
    },
  TransmissionPeerConfig():
    $.PeerConfig("Transmission/2.77", "-TR2770-"),
  TorrentTrackers(trackers):
    {
      ["bt-tracker"]: std.join(',', trackers),
    },
  TorrentConfig(seed_ratio = "0.1",
                seed_time = "0",
                max_upload_limit = 0,
                max_overall_upload_limit = "256K",
                save_metadata = true,
                peer_exchange = true,
                local_peer_discovery = false,
                listen_port = "50101-50109"):
    {
      ["bt-save-metadata"]: save_metadata,
      ["listen-port"]: listen_port,
      ["seed-time"]: seed_time,
      ["seed-ratio"]: seed_ratio,
      ["max-overall-upload-limit"]: max_overall_upload_limit,
      ["max-upload-limit"]: max_upload_limit,
      ["bt-enable-lpd"]: local_peer_discovery,
      ["dht-listen-port"]: listen_port,
      ["enable-peer-exchange"]: peer_exchange,
    },
  manifest(config):
    std.manifestIni({
      main: config,
      sections: {}
    }),
}
