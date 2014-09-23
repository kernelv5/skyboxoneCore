<li ng-class="{
		active: Navigation.isStarredActive(),
		unread: Navigation.getStarredCount() > 0
	}"
	class="starred has-counter">

	<a class="icon-starred" ng-href="#/items/starred/">
	   <?php p($l->t('Starred')) ?>
	</a>

	<div class="app-navigation-entry-utils">
        <ul>
            <li class="app-navigation-entry-utils-counter"
                ng-show="Navigation.getStarredCount() > 0">
                {{ Navigation.getStarredCount() | unreadCountFormatter }}
            </li>
        </ul>
    </div>
</li>