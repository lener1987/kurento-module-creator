${remoteClass.name}Internal.hpp
/* Autogenerated with Kurento Idl */

#ifndef __${camelToUnderscore(remoteClass.name)}_INTERNAL_HPP__
#define __${camelToUnderscore(remoteClass.name)}_INTERNAL_HPP__

#include "${remoteClass.name}.hpp"

namespace kurento
{

class JsonSerializer;
<#list remoteClassDependencies(remoteClass) as dependency>
class ${dependency.name};
</#list>
<#list remoteClass.methods as method><#rt>

class ${remoteClass.name}Method${method.name?cap_first}
{
public:
  ${remoteClass.name}Method${method.name?cap_first}() {}
  ~${remoteClass.name}Method${method.name?cap_first}() {}

  ${getCppObjectType(method.return, false)} invoke (std::shared_ptr<${remoteClass.name}> obj);
  void Serialize (JsonSerializer &serializer);
  <#list method.params as param>

  ${getCppObjectType (param.type, false)} get${param.name?cap_first} () {
    return ${param.name};
  }

  void set${param.name?cap_first} (${getCppObjectType (param.type, true)}${param.name}) {
    this->${param.name} = ${param.name};
    <#if param.optional>
    __isSet${param.name?cap_first} = true;
    </#if>
  }
  </#list>

<#if method.params[0]??>
private:
</#if>
  <#list method.params as param>
  ${getCppObjectType(param.type, false)} ${param.name};
  <#if param.optional>
  bool __isSet${param.name?cap_first} = false;
  </#if>
  </#list>
};
</#list>
<#if remoteClass.constructor??><#rt>

class ${remoteClass.name}Constructor
{
public:
  ${remoteClass.name}Constructor () {}
  ~${remoteClass.name}Constructor () {}

  void Serialize (JsonSerializer &serializer);
  <#list remoteClass.constructor.params as param>

  ${getCppObjectType (param.type, false)} get${param.name?cap_first} ();

  void set${param.name?cap_first} (${getCppObjectType (param.type, true)}${param.name}) {
    this->${param.name} = ${param.name};
    <#if param.optional>
    __isSet${param.name?cap_first} = true;
    __isSetDefault${param.name?cap_first} = false;
    </#if>
  }
  </#list>

<#if remoteClass.constructor.params[0]??>
private:
</#if>
  <#list remoteClass.constructor.params as param>
  ${getCppObjectType(param.type, false)} ${param.name};
  <#if param.optional>
  bool __isSet${param.name?cap_first} = false;
  bool __isSetDefault${param.name?cap_first} = false;
  </#if>
  </#list>
};
</#if>

} /* kurento */

#endif /*  __${camelToUnderscore(remoteClass.name)}_INTERNAL_HPP__ */
