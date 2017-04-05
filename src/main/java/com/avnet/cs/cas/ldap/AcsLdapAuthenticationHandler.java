package com.avnet.cs.cas.ldap;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.authentication.AccountDisabledException;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.LdapAuthenticationHandler;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.ldaptive.auth.Authenticator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.security.auth.login.AccountLockedException;
import javax.security.auth.login.FailedLoginException;
import java.security.GeneralSecurityException;

/**
 * @author Kamran Zafar (N000989)
 *         Created on 21/09/2015
 */
public class AcsLdapAuthenticationHandler extends LdapAuthenticationHandler {
	private static final Logger logger = LoggerFactory.getLogger(AcsLdapAuthenticationHandler.class);

	protected static final String ATTR_LOCKED = "locked";
	protected static final String ATTR_ENABLED = "enabled";


	public AcsLdapAuthenticationHandler(Authenticator authenticator) {
		super(authenticator);
	}

	@Override
	protected HandlerResult authenticateUsernamePasswordInternal(UsernamePasswordCredential upc)
			throws GeneralSecurityException, PreventedException {
		logger.info("Username: " + upc.getUsername());

		try {
			HandlerResult result = super.authenticateUsernamePasswordInternal(upc);

			SimplePrincipal userPrincipal = ((SimplePrincipal) result.getPrincipal());

			Boolean locked = getBooleanValue(userPrincipal.getAttributes().get(ATTR_LOCKED));
			Boolean enabled = getBooleanValue(userPrincipal.getAttributes().get(ATTR_ENABLED));

			if (locked != null && locked) {
				throw new AccountLockedException("Your account is locked. Please contact your system administrator.");
			}

			if (enabled != null && !enabled) {
				throw new AccountDisabledException("Your account is disabled. Please contact your system administrator.");
			}


			return result;
		} catch (FailedLoginException e) {
			logger.error(e.getMessage(), e);

			throw e;
		} catch (Throwable e) {
			logger.error(e.getMessage(), e);

			throw e;
		}
	}


	private boolean getBooleanValue(Object val) {
		if (StringUtils.isBlank((String) val)) {
			return false;
		}

		try {
			return Boolean.parseBoolean(((String) val).toLowerCase());
		} catch (Exception e) {
			return false;
		}
	}
}
