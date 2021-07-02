package org.np.security;

import org.np.domain.ArtistVO;
import org.np.domain.MemberVO;
import org.np.mapper.ArtistMapper;
import org.np.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ArtistMapper aMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO mvo = mapper.read(username);
		ArtistVO avo = aMapper.read(username);
		CustomUser cust = null;
		
		log.warn("userId =" +  mvo);
		log.warn("artistId =" +  avo);
		
		if(avo==null) {
			cust = new CustomUser(mvo);
		}
		
		if(mvo==null) {
			cust = new CustomUser(avo);
		}

		return cust;
	}

}
