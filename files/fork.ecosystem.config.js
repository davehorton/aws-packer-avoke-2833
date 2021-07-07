module.exports = {
  apps : [
  {
    name: 'avoke-rtpengine-fork',
    cwd: '/home/admin/apps/avoke-rtpengine-fork',
    script: 'app.js',
    exec_mode: 'fork',
    instances: 1,
    autorestart: true,
    watch: false,
    env: {
       RTPENGINE_URL: 'ws://127.0.0.1:8080'
    }
  }]
};

