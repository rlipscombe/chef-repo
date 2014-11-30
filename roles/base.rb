name 'base'

run_list(
	'apt',
        'chef-solo-search',
        'users::sysadmins',
        'sudo'
)

default_attributes(
      'authorization' => {
          'sudo' => {
              # Ubuntu 14.04 defaults:
              'sudoers_defaults' => [
                  'env_reset',
                  'mail_badpass',
                  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
              ],
              'users' => ['ubuntu'],
              'groups' => ['admin', 'sudo', 'sysadmin'],
              'passwordless' => true,
              'include_sudoers_d' => true
          }
      }
)

