<?php

/**
 * Ushahidi Platform Acl interface
 *
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi\Platform
 * @copyright  2014 Ushahidi
 * @license    https://www.gnu.org/licenses/agpl-3.0.html GNU Affero General Public License Version 3 (AGPL3)
 */

namespace Ushahidi\Core\Tool;

use Ushahidi\Core\Entity\User;

interface Acl
{
	/**
	 * Check if User has permission
	 * @param Ushahidi|Core|Entity|User $user
	 * @param Array $permissions A list of permissions to check for
	 * @return Boolean
	 */
	public function hasPermission(User $user, Array $permissions);
}