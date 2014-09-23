-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2014 at 05:24 AM
-- Server version: 5.5.37-MariaDB
-- PHP Version: 5.5.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `skyboxone`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_activity`
--

CREATE TABLE IF NOT EXISTS `oc_activity` (
`activity_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `subjectparams` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `messageparams` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_activity_mq`
--

CREATE TABLE IF NOT EXISTS `oc_activity_mq` (
`mail_id` int(11) NOT NULL,
  `amq_timestamp` int(11) NOT NULL DEFAULT '0',
  `amq_latest_send` int(11) NOT NULL DEFAULT '0',
  `amq_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `amq_appid` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subjectparams` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_appconfig`
--

CREATE TABLE IF NOT EXISTS `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_appconfig`
--

INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES
('activity', 'enabled', 'yes'),
('activity', 'installed_version', '1.1.23'),
('activity', 'ocsid', '166038'),
('activity', 'types', 'filesystem'),
('backgroundjob', 'lastjob', '1'),
('calendar', 'enabled', 'yes'),
('calendar', 'installed_version', '0.6.4'),
('calendar', 'ocsid', '166043'),
('calendar', 'types', ''),
('contacts', 'enabled', 'yes'),
('contacts', 'installed_version', '0.3.0.17'),
('contacts', 'ocsid', '166044'),
('contacts', 'types', ''),
('core', 'global_cache_gc_lastrun', '1411017754'),
('core', 'installedat', '1411017747.2558'),
('core', 'lastcron', '1411017754'),
('core', 'lastupdatedat', '1411017747.2572'),
('core', 'public_caldav', 'calendar/share.php'),
('core', 'public_calendar', 'calendar/share.php'),
('core', 'public_documents', 'documents/public.php'),
('core', 'public_files', 'files_sharing/public.php'),
('core', 'public_gallery', 'gallery/public.php'),
('core', 'public_webdav', 'files_sharing/publicwebdav.php'),
('core', 'remote_caldav', 'calendar/appinfo/remote.php'),
('core', 'remote_calendar', 'calendar/appinfo/remote.php'),
('core', 'remote_carddav', 'contacts/appinfo/remote.php'),
('core', 'remote_contacts', 'contacts/appinfo/remote.php'),
('core', 'remote_files', 'files/appinfo/remote.php'),
('core', 'remote_filesync', 'files/appinfo/filesync.php'),
('core', 'remote_webdav', 'files/appinfo/remote.php'),
('documents', 'enabled', 'yes'),
('documents', 'installed_version', '0.8.2'),
('documents', 'ocsid', '166045'),
('documents', 'types', ''),
('files', 'enabled', 'yes'),
('files', 'installed_version', '1.1.9'),
('files', 'types', 'filesystem'),
('files_pdfviewer', 'enabled', 'yes'),
('files_pdfviewer', 'installed_version', '0.5'),
('files_pdfviewer', 'ocsid', '166049'),
('files_pdfviewer', 'types', ''),
('files_sharing', 'enabled', 'yes'),
('files_sharing', 'installed_version', '0.5.3'),
('files_sharing', 'ocsid', '166050'),
('files_sharing', 'types', 'filesystem'),
('files_texteditor', 'enabled', 'yes'),
('files_texteditor', 'installed_version', '0.4'),
('files_texteditor', 'ocsid', '166051'),
('files_texteditor', 'types', ''),
('files_trashbin', 'enabled', 'yes'),
('files_trashbin', 'installed_version', '0.6.2'),
('files_trashbin', 'ocsid', '166052'),
('files_trashbin', 'types', 'filesystem'),
('files_versions', 'enabled', 'yes'),
('files_versions', 'installed_version', '1.0.5'),
('files_versions', 'ocsid', '166053'),
('files_versions', 'types', 'filesystem'),
('files_videoviewer', 'enabled', 'yes'),
('files_videoviewer', 'installed_version', '0.1.3'),
('files_videoviewer', 'ocsid', '166054'),
('files_videoviewer', 'types', ''),
('firstrunwizard', 'enabled', 'yes'),
('firstrunwizard', 'installed_version', '1.1'),
('firstrunwizard', 'ocsid', '166055'),
('firstrunwizard', 'types', ''),
('gallery', 'enabled', 'yes'),
('gallery', 'installed_version', '0.5.4'),
('gallery', 'ocsid', '166056'),
('gallery', 'types', 'filesystem'),
('search_lucene', 'enabled', 'yes'),
('search_lucene', 'installed_version', '0.5.3'),
('search_lucene', 'ocsid', '166057'),
('search_lucene', 'types', 'filesystem'),
('templateeditor', 'enabled', 'yes'),
('templateeditor', 'installed_version', '0.1'),
('templateeditor', 'types', ''),
('updater', 'enabled', 'yes'),
('updater', 'installed_version', '0.4'),
('updater', 'ocsid', '166059'),
('updater', 'types', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_clndr_calendars`
--

CREATE TABLE IF NOT EXISTS `oc_clndr_calendars` (
`id` int(10) unsigned NOT NULL,
  `userid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `ctag` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8_bin,
  `components` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_clndr_objects`
--

CREATE TABLE IF NOT EXISTS `oc_clndr_objects` (
`id` int(10) unsigned NOT NULL,
  `calendarid` int(10) unsigned NOT NULL DEFAULT '0',
  `objecttype` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `startdate` datetime DEFAULT '1970-01-01 00:00:00',
  `enddate` datetime DEFAULT '1970-01-01 00:00:00',
  `repeating` int(11) DEFAULT '0',
  `summary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `calendardata` longtext COLLATE utf8_bin,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_clndr_repeat`
--

CREATE TABLE IF NOT EXISTS `oc_clndr_repeat` (
`id` int(10) unsigned NOT NULL,
  `eventid` int(10) unsigned NOT NULL DEFAULT '0',
  `calid` int(10) unsigned NOT NULL DEFAULT '0',
  `startdate` datetime DEFAULT '1970-01-01 00:00:00',
  `enddate` datetime DEFAULT '1970-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_clndr_share_calendar`
--

CREATE TABLE IF NOT EXISTS `oc_clndr_share_calendar` (
  `owner` varchar(255) COLLATE utf8_bin NOT NULL,
  `share` varchar(255) COLLATE utf8_bin NOT NULL,
  `sharetype` varchar(6) COLLATE utf8_bin NOT NULL,
  `calendarid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `permissions` smallint(6) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_clndr_share_event`
--

CREATE TABLE IF NOT EXISTS `oc_clndr_share_event` (
  `owner` varchar(255) COLLATE utf8_bin NOT NULL,
  `share` varchar(255) COLLATE utf8_bin NOT NULL,
  `sharetype` varchar(6) COLLATE utf8_bin NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `permissions` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_contacts_addressbooks`
--

CREATE TABLE IF NOT EXISTS `oc_contacts_addressbooks` (
`id` int(10) unsigned NOT NULL,
  `userid` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `displayname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uri` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ctag` int(10) unsigned NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_contacts_cards`
--

CREATE TABLE IF NOT EXISTS `oc_contacts_cards` (
`id` int(10) unsigned NOT NULL,
  `addressbookid` int(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `carddata` longtext COLLATE utf8_bin,
  `uri` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_contacts_cards_properties`
--

CREATE TABLE IF NOT EXISTS `oc_contacts_cards_properties` (
`id` int(10) unsigned NOT NULL,
  `userid` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `contactid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_documents_invite`
--

CREATE TABLE IF NOT EXISTS `oc_documents_invite` (
  `es_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Related editing session id',
  `uid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `sent_on` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_documents_member`
--

CREATE TABLE IF NOT EXISTS `oc_documents_member` (
`member_id` int(10) unsigned NOT NULL COMMENT 'Unique per user and session',
  `es_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Related editing session id',
  `uid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `last_activity` int(10) unsigned DEFAULT NULL,
  `is_guest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_documents_op`
--

CREATE TABLE IF NOT EXISTS `oc_documents_op` (
`seq` int(10) unsigned NOT NULL COMMENT 'Sequence number',
  `es_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Editing session id',
  `member` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'User and time specific',
  `opspec` longtext COLLATE utf8_bin COMMENT 'json-string'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_documents_revisions`
--

CREATE TABLE IF NOT EXISTS `oc_documents_revisions` (
  `es_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Related editing session id',
  `seq_head` int(10) unsigned NOT NULL COMMENT 'Sequence head number',
  `member_id` int(10) unsigned NOT NULL COMMENT 'the member that saved the revision',
  `file_id` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `save_hash` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'used to lookup revision in documents folder of member, eg hash.odt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_documents_session`
--

CREATE TABLE IF NOT EXISTS `oc_documents_session` (
  `es_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Editing session id',
  `genesis_url` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'Relative to owner documents storage /welcome.odt',
  `genesis_hash` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'To be sure the genesis did not change',
  `file_id` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `owner` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'oC user who created the session'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filecache`
--

CREATE TABLE IF NOT EXISTS `oc_filecache` (
`fileid` int(11) NOT NULL,
  `storage` int(11) NOT NULL DEFAULT '0',
  `path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT '0',
  `mimepart` int(11) NOT NULL DEFAULT '0',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `storage_mtime` int(11) NOT NULL DEFAULT '0',
  `encrypted` int(11) NOT NULL DEFAULT '0',
  `unencrypted_size` bigint(20) NOT NULL DEFAULT '0',
  `etag` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_files_trash`
--

CREATE TABLE IF NOT EXISTS `oc_files_trash` (
`auto_id` int(11) NOT NULL,
  `id` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_file_map`
--

CREATE TABLE IF NOT EXISTS `oc_file_map` (
  `logic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `logic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_gallery_sharing`
--

CREATE TABLE IF NOT EXISTS `oc_gallery_sharing` (
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `gallery_id` int(11) NOT NULL DEFAULT '0',
  `recursive` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_groups`
--

CREATE TABLE IF NOT EXISTS `oc_groups` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_groups`
--

INSERT INTO `oc_groups` (`gid`) VALUES
('admin');

-- --------------------------------------------------------

--
-- Table structure for table `oc_group_admin`
--

CREATE TABLE IF NOT EXISTS `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_group_user`
--

CREATE TABLE IF NOT EXISTS `oc_group_user` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_group_user`
--

INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `oc_jobs`
--

CREATE TABLE IF NOT EXISTS `oc_jobs` (
`id` int(10) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `argument` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_jobs`
--

INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`) VALUES
(1, 'OC\\Cache\\FileGlobalGC', 'null', 1411017754),
(2, 'OCA\\Activity\\BackgroundJob\\EmailNotification', 'null', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_locks`
--

CREATE TABLE IF NOT EXISTS `oc_locks` (
`id` int(10) unsigned NOT NULL,
  `userid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `timeout` int(10) unsigned DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `scope` smallint(6) DEFAULT NULL,
  `depth` smallint(6) DEFAULT NULL,
  `uri` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_lucene_status`
--

CREATE TABLE IF NOT EXISTS `oc_lucene_status` (
  `fileid` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_mimetypes`
--

CREATE TABLE IF NOT EXISTS `oc_mimetypes` (
`id` int(11) NOT NULL,
  `mimetype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pictures_images_cache`
--

CREATE TABLE IF NOT EXISTS `oc_pictures_images_cache` (
  `uid_owner` varchar(64) COLLATE utf8_bin NOT NULL,
  `path` varchar(256) COLLATE utf8_bin NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_preferences`
--

CREATE TABLE IF NOT EXISTS `oc_preferences` (
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_preferences`
--

INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES
('admin', 'login', 'lastLogin', '1411017747');

-- --------------------------------------------------------

--
-- Table structure for table `oc_privatedata`
--

CREATE TABLE IF NOT EXISTS `oc_privatedata` (
`keyid` int(10) unsigned NOT NULL,
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_properties`
--

CREATE TABLE IF NOT EXISTS `oc_properties` (
`id` int(11) NOT NULL,
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyvalue` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_share`
--

CREATE TABLE IF NOT EXISTS `oc_share` (
`id` int(11) NOT NULL,
  `share_type` smallint(6) NOT NULL DEFAULT '0',
  `share_with` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_source` int(11) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT '0',
  `stime` bigint(20) NOT NULL DEFAULT '0',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_share_external`
--

CREATE TABLE IF NOT EXISTS `oc_share_external` (
`id` int(11) NOT NULL,
  `remote` varchar(512) COLLATE utf8_bin NOT NULL COMMENT 'Url of the remove owncloud instance',
  `share_token` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Public share token',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Optional password for the public share',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Original name on the remote server',
  `owner` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'User that owns the public share on the remote server',
  `user` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Local user which added the external share',
  `mountpoint` varchar(4000) COLLATE utf8_bin NOT NULL COMMENT 'Full path where the share is mounted',
  `mountpoint_hash` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'md5 hash of the mountpoint'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_storages`
--

CREATE TABLE IF NOT EXISTS `oc_storages` (
  `id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
`numeric_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_users`
--

CREATE TABLE IF NOT EXISTS `oc_users` (
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_users`
--

INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES
('admin', NULL, '$2a$08$/UixwxP.HBRSR5RRZbKv4OtXJGA.mjTZ4dXHX..6VjDMPOy0efLW2');

-- --------------------------------------------------------

--
-- Table structure for table `oc_vcategory`
--

CREATE TABLE IF NOT EXISTS `oc_vcategory` (
`id` int(10) unsigned NOT NULL,
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_vcategory_to_object`
--

CREATE TABLE IF NOT EXISTS `oc_vcategory_to_object` (
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_activity`
--
ALTER TABLE `oc_activity`
 ADD PRIMARY KEY (`activity_id`), ADD KEY `activity_user_time` (`affecteduser`,`timestamp`), ADD KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`), ADD KEY `activity_filter_app` (`affecteduser`,`app`,`timestamp`);

--
-- Indexes for table `oc_activity_mq`
--
ALTER TABLE `oc_activity_mq`
 ADD PRIMARY KEY (`mail_id`), ADD KEY `amp_user` (`amq_affecteduser`), ADD KEY `amp_latest_send_time` (`amq_latest_send`), ADD KEY `amp_timestamp_time` (`amq_timestamp`);

--
-- Indexes for table `oc_appconfig`
--
ALTER TABLE `oc_appconfig`
 ADD PRIMARY KEY (`appid`,`configkey`), ADD KEY `appconfig_config_key_index` (`configkey`), ADD KEY `appconfig_appid_key` (`appid`);

--
-- Indexes for table `oc_clndr_calendars`
--
ALTER TABLE `oc_clndr_calendars`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_clndr_objects`
--
ALTER TABLE `oc_clndr_objects`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_clndr_repeat`
--
ALTER TABLE `oc_clndr_repeat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_contacts_addressbooks`
--
ALTER TABLE `oc_contacts_addressbooks`
 ADD PRIMARY KEY (`id`), ADD KEY `c_addressbook_userid_index` (`userid`);

--
-- Indexes for table `oc_contacts_cards`
--
ALTER TABLE `oc_contacts_cards`
 ADD PRIMARY KEY (`id`), ADD KEY `c_addressbookid_index` (`addressbookid`);

--
-- Indexes for table `oc_contacts_cards_properties`
--
ALTER TABLE `oc_contacts_cards_properties`
 ADD PRIMARY KEY (`id`), ADD KEY `cp_contactid_index` (`contactid`), ADD KEY `cp_name_index` (`name`), ADD KEY `cp_value_index` (`value`);

--
-- Indexes for table `oc_documents_member`
--
ALTER TABLE `oc_documents_member`
 ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `oc_documents_op`
--
ALTER TABLE `oc_documents_op`
 ADD PRIMARY KEY (`seq`), ADD UNIQUE KEY `documents_op_eis_idx` (`es_id`,`seq`);

--
-- Indexes for table `oc_documents_revisions`
--
ALTER TABLE `oc_documents_revisions`
 ADD UNIQUE KEY `documents_rev_eis_idx` (`es_id`,`seq_head`);

--
-- Indexes for table `oc_documents_session`
--
ALTER TABLE `oc_documents_session`
 ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `oc_filecache`
--
ALTER TABLE `oc_filecache`
 ADD PRIMARY KEY (`fileid`), ADD UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`), ADD KEY `fs_parent_name_hash` (`parent`,`name`), ADD KEY `fs_storage_mimetype` (`storage`,`mimetype`), ADD KEY `fs_storage_mimepart` (`storage`,`mimepart`), ADD KEY `fs_storage_size` (`storage`,`size`,`fileid`);

--
-- Indexes for table `oc_files_trash`
--
ALTER TABLE `oc_files_trash`
 ADD PRIMARY KEY (`auto_id`), ADD KEY `id_index` (`id`), ADD KEY `timestamp_index` (`timestamp`), ADD KEY `user_index` (`user`);

--
-- Indexes for table `oc_file_map`
--
ALTER TABLE `oc_file_map`
 ADD PRIMARY KEY (`logic_path_hash`), ADD UNIQUE KEY `file_map_pp_index` (`physic_path_hash`);

--
-- Indexes for table `oc_groups`
--
ALTER TABLE `oc_groups`
 ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `oc_group_admin`
--
ALTER TABLE `oc_group_admin`
 ADD PRIMARY KEY (`gid`,`uid`), ADD KEY `group_admin_uid` (`uid`);

--
-- Indexes for table `oc_group_user`
--
ALTER TABLE `oc_group_user`
 ADD PRIMARY KEY (`gid`,`uid`);

--
-- Indexes for table `oc_jobs`
--
ALTER TABLE `oc_jobs`
 ADD PRIMARY KEY (`id`), ADD KEY `job_class_index` (`class`);

--
-- Indexes for table `oc_locks`
--
ALTER TABLE `oc_locks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_lucene_status`
--
ALTER TABLE `oc_lucene_status`
 ADD PRIMARY KEY (`fileid`), ADD KEY `status_index` (`status`);

--
-- Indexes for table `oc_mimetypes`
--
ALTER TABLE `oc_mimetypes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mimetype_id_index` (`mimetype`);

--
-- Indexes for table `oc_preferences`
--
ALTER TABLE `oc_preferences`
 ADD PRIMARY KEY (`userid`,`appid`,`configkey`);

--
-- Indexes for table `oc_privatedata`
--
ALTER TABLE `oc_privatedata`
 ADD PRIMARY KEY (`keyid`);

--
-- Indexes for table `oc_properties`
--
ALTER TABLE `oc_properties`
 ADD PRIMARY KEY (`id`), ADD KEY `property_index` (`userid`);

--
-- Indexes for table `oc_share`
--
ALTER TABLE `oc_share`
 ADD PRIMARY KEY (`id`), ADD KEY `item_share_type_index` (`item_type`,`share_type`), ADD KEY `file_source_index` (`file_source`), ADD KEY `token_index` (`token`);

--
-- Indexes for table `oc_share_external`
--
ALTER TABLE `oc_share_external`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`), ADD KEY `sh_external_user` (`user`);

--
-- Indexes for table `oc_storages`
--
ALTER TABLE `oc_storages`
 ADD PRIMARY KEY (`numeric_id`), ADD UNIQUE KEY `storages_id_index` (`id`);

--
-- Indexes for table `oc_users`
--
ALTER TABLE `oc_users`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `oc_vcategory`
--
ALTER TABLE `oc_vcategory`
 ADD PRIMARY KEY (`id`), ADD KEY `uid_index` (`uid`), ADD KEY `type_index` (`type`), ADD KEY `category_index` (`category`);

--
-- Indexes for table `oc_vcategory_to_object`
--
ALTER TABLE `oc_vcategory_to_object`
 ADD PRIMARY KEY (`categoryid`,`objid`,`type`), ADD KEY `vcategory_objectd_index` (`objid`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_activity`
--
ALTER TABLE `oc_activity`
MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_activity_mq`
--
ALTER TABLE `oc_activity_mq`
MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_clndr_calendars`
--
ALTER TABLE `oc_clndr_calendars`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_clndr_objects`
--
ALTER TABLE `oc_clndr_objects`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_clndr_repeat`
--
ALTER TABLE `oc_clndr_repeat`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_contacts_addressbooks`
--
ALTER TABLE `oc_contacts_addressbooks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_contacts_cards`
--
ALTER TABLE `oc_contacts_cards`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_contacts_cards_properties`
--
ALTER TABLE `oc_contacts_cards_properties`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_documents_member`
--
ALTER TABLE `oc_documents_member`
MODIFY `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique per user and session';
--
-- AUTO_INCREMENT for table `oc_documents_op`
--
ALTER TABLE `oc_documents_op`
MODIFY `seq` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sequence number';
--
-- AUTO_INCREMENT for table `oc_filecache`
--
ALTER TABLE `oc_filecache`
MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_files_trash`
--
ALTER TABLE `oc_files_trash`
MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_jobs`
--
ALTER TABLE `oc_jobs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_locks`
--
ALTER TABLE `oc_locks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_mimetypes`
--
ALTER TABLE `oc_mimetypes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_privatedata`
--
ALTER TABLE `oc_privatedata`
MODIFY `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_properties`
--
ALTER TABLE `oc_properties`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_share`
--
ALTER TABLE `oc_share`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_share_external`
--
ALTER TABLE `oc_share_external`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_storages`
--
ALTER TABLE `oc_storages`
MODIFY `numeric_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_vcategory`
--
ALTER TABLE `oc_vcategory`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



CREATE USER 'skyboxone'@'localhost' IDENTIFIED BY 'qwerty123';

GRANT SELECT, INSERT, UPDATE, REFERENCES, DELETE, CREATE, DROP, ALTER, INDEX, TRIGGER, CREATE VIEW, SHOW VIEW, EXECUTE, ALTER ROUTINE, CREATE ROUTINE, CREATE TEMPORARY TABLES, LOCK TABLES, EVENT ON `skyboxone`.* TO 'skyboxone'@'localhost';

GRANT GRANT OPTION ON `skyboxone`.* TO 'skyboxone'@'localhost';
