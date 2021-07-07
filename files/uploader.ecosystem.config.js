module.exports = {
  apps : [
  {
    name: 'avoke-recording-uploader',
    cwd: '/home/admin/apps/avoke-recording-uploader',
    script: 'app.js',
    exec_mode: 'fork',
    instances: 1,
    autorestart: true,
    watch: false,
    env: {
       WS_URL: 'wss://34.67.44.15:30443',
       WS_SUBPROTOCOL: 'metadata.avoke.com',
       RECORDING_METADATA_FOLDER: '/tmp/metadata',
       WORK_FOLDER: '/tmp/work'
    }
  }]
};
