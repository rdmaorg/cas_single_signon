package com.avnet.cs.cas.ad;

import org.ldaptive.SearchFilter;
import org.ldaptive.SearchRequest;
import org.ldaptive.SearchScope;
import org.ldaptive.auth.AuthenticationCriteria;
import org.ldaptive.auth.SearchEntryResolver;

public class AcsActiveDirectorySearchEntryResolver extends SearchEntryResolver {

    /** search filter. */
    private String searchFilter;

    /** Base DN of LDAP subtree search. */
    private String baseDn;

    /**
     * Sets the base DN used for the subtree search for LDAP entry.
     *
     * @param dn Subtree search base DN.
     */
    public void setBaseDn(final String dn) {
        this.baseDn = dn;
    }

    
    public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}


	/** {@inheritDoc} */
    @Override
    protected SearchRequest createSearchRequest(final AuthenticationCriteria ac) {
        final SearchRequest sr = new SearchRequest();
        sr.setSearchScope(SearchScope.SUBTREE);
        sr.setBaseDn(this.baseDn);
        sr.setSearchFilter(new SearchFilter(searchFilter.replace("{user}", "{0}"), new Object[] {ac.getDn()}));
        sr.setSearchEntryHandlers(getSearchEntryHandlers());
        sr.setReturnAttributes(ac.getAuthenticationRequest().getReturnAttributes());
        return sr;
    }
}
