package webprojects

import org.apache.commons.lang.builder.HashCodeBuilder

import javax.jdo.annotations.*;
// import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
class UserRoleJDO implements Serializable {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Long id
    @Persistent
	UserJDO user
    @Persistent
	RoleJDO role

	boolean equals(other) {
		if (!(other instanceof UserRoleJDO)) {
			return false
		}

		other.user?.id == user?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static UserRoleJDO get(long userId, long roleId) {
		find 'from UserRoleJDO where user.id=:userId and role.id=:roleId',
			[userId: userId, roleId: roleId]
	}

	static UserRoleJDO create(UserJDO user, RoleJDO role, boolean flush = false) {
		new UserRoleJDO(user: user, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(UserJDO user, RoleJDO role, boolean flush = false) {
		UserRoleJDO instance = UserRoleJDO.findByUserAndRole(user, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(UserJDO user) {
		executeUpdate 'DELETE FROM UserRoleJDO WHERE user=:user', [user: user]
	}

	static void removeAll(RoleJDO role) {
		executeUpdate 'DELETE FROM UserRoleJDO WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'user']
		version false
	}
}
