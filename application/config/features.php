<?php defined('SYSPATH') OR die('No direct access allowed.');

/**
 * Features Config
 *
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi\Application\Config
 * @copyright  2014 Ushahidi
 * @license    https://www.gnu.org/licenses/agpl-3.0.html GNU Affero General Public License Version 3 (AGPL3)
 */

return [
	// Determines which features are available in a deployment

	// Post views
	'views' => [
		'map' => TRUE,
		'list' => TRUE,
		'chart' => TRUE,
		'timeline' => TRUE,
		'activity' => TRUE,
	],

	// Data sources
	'data-providers' => [
		'smssync' => TRUE,
		'twitter' => TRUE,
		'frontlinesms' => TRUE,
		'email' => TRUE,
		'twilio' => TRUE,
		'nexmo' => TRUE,
	],

	// Client limits
	// Where TRUE is infinite and an integer defines a limit
	'limits' => [
		'posts' => TRUE,
		'forms' => TRUE,
		'admin_users' => TRUE,
	],

	// Private deployments
	'private' => [
		'enabled' => TRUE,
	],

	// Roles
	'roles' => [
		'enabled' => TRUE,
	],

	// Data import
	'data-import' => [
		'enabled' => TRUE,
	],
];
