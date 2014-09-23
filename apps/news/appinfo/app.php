<?php
/**
 * ownCloud - News
 *
 * This file is licensed under the Affero General Public License version 3 or
 * later. See the COPYING file.
 *
 * @author Alessandro Cosentino <cosenal@gmail.com>
 * @author Bernhard Posselt <dev@bernhard-posselt.com>
 * @copyright Alessandro Cosentino 2012
 * @copyright Bernhard Posselt 2012, 2014
 */

namespace OCA\News\AppInfo;

use \OCA\News\Config\DependencyException;


require_once __DIR__ . '/setup.php';

if (is_setup()) {

	$container = new Application();

	$config = $container->getAppConfig();
	$config->loadConfig(__DIR__ . '/app.json');
	$config->registerNavigation();
	$config->registerBackgroundJobs();
	$config->registerHooks();

	// check for correct app dependencies
	try {
		$config->testDependencies();
	} catch(DependencyException $e) {
		$logger = $container->getLogger();
		$params = $container->getLoggerParameters();
		$logger->emergency($e->getMessage(), $params);
	}

}