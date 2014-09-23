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

require_once __DIR__ . '/../3rdparty/simplepie/autoloader.php';
require_once __DIR__ . '/../../../tests/lib/appframework/db/mappertestutility.php';

// to execute without owncloud, we need to create our own classloader
spl_autoload_register(function ($className){
        if (strpos($className, 'OCA\\') === 0) {

                $path = strtolower(str_replace('\\', '/', substr($className, 3)) . '.php');
                $relPath = __DIR__ . '/../..' . $path;

                if(file_exists($relPath)){
                        require_once $relPath;
                }
        } else if(strpos($className, 'OCP\\') === 0) {
                $path = strtolower(str_replace('\\', '/', substr($className, 3)) . '.php');
                $relPath = __DIR__ . '/../../../lib/public' . $path;

                if(file_exists($relPath)){
                        require_once $relPath;
                }
        }
});