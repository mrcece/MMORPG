# 一.表格说明

- Aura为光环配置表
- 一行一个aura(auraID+等级)

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名                   | 字段含义                                                   |
| :----------------------- | :--------------------------------------------------------- |
|ID|唯一id|
|AuraID|aura id|
|AuraLevel|aura等级|
|IsShowIcon|是否显示icon|
|Icon|icon名字|
|Name|aura名称|
|Effect|aura效果,同Buff表Effect字段|
|Type|aura类型,0:增益,1:减益|
|TotalTime*|持续时间,单位ms|
|ResetTotalTime*|重置持续时间,单位ms|
|Interval*|间隔时间,单位ms|
|AuraType*|影响的目标类型|
|AuraAddBuffNum*|aura影响目标数|
|AuraRadiusMode*|aura范围模式|
|AuraMinRadius*|aura最小范围|
|AuraMaxRadius*|aura最大范围|
|Overlap*|aura叠加上限|
|EffectID1|aura影响的固定属性id,同Buff表对应字段|
|EffectValue1|aura影响的固定属性值,同Buff表对应字段|
|IsPercentOnMax1|aura影响的固定属性,是否基于最大值百分比,同Buff表对应字段|
|EffectID2|同1|
|EffectValue2|同1|
|IsPercentOnMax2|同1|
|EffectID3|同1|
|EffectValue3|同1|
|IsPercentOnMax3|同1|
|EffectID4|同1|
|EffectValue4|同1|
|IsPercentOnMax4|同1|
|SpeedPara|aura影响的属性:速度百分比|
|ReboundPara|aura影响的属性:反弹百分比|
|VampPara|aura影响的属性:吸血百分比|
|AuraAddBuff*|aura加buff|
|ImmuneBuffIDs*|aura免疫buff|
|AuraLastTime*|离开aura后,aura效果的持续时间|
|StopCondition|aura停止条件,同Buff表StopCondition字段|
|Scale|模型缩放比例|
|AuraFx|施法者特效|
|Fx|buff目标特效|
|AttackerFx|攻击特效|
|DefenderFx|受击特效|
|IntervalFx|间隔特效|
|LoopAudio|循环音效|

# 三.表格字段详细说明

- TotalTime,AuraLastTime,Interval
  - TotalTime是aura的时长
  - 当aura取消/结束,对象离开aura时,aura效果会持续一段时间(AuraLastTime)
  - aura效果以间隔时间(Interval)影响对象
  - ResetTotalTime?
- AuraType:光环影响的对象类型
  - 0  所有对象
  - 1  友方对象
  - 2  敌方对象
- AuraAddBuffNum
  - aura每次检测时,AuraAddBuffNum-已获得aura效果的人数,即为当前可增加aura效果的最大人数
- AuraRadiusMode,AuraMinRadius,AuraMaxRadius,ResetTotalTime
  - AuraRadiusMode:aura范围模式
    - 0  固定模式,影响范围是[min,max]
    - 1  解放模式
      - 解放前,用[0,min]范围
      - 解放后,在ResetTotalTime内,范围从[0,min]->[0,max],然后结束
- Overlap
  - 光环的叠加层数
  - 相同auraID,Lv的光环重叠区域,才会有叠加效果
- AuraAddBuff
  - 格式:buffID,Lv;buffID,Lv...
  - 对象进入aura时,加一次buff
- ImmuneBuffIDs
  - 格式:buffID,buffID...
  - 去除已存在的免疫buff
  - 禁止添加新的免疫buff