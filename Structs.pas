unit Structs;

interface

Uses
Windows;

{$REGION 'Header'}
type sHeader = Record
  Size  : Smallint;
  Key   : Byte;
  ChkSum: Byte;
  Index : Smallint;
  Code  : Smallint;
  Time  : LongInt;
end;
{$ENDREGION}

{$REGION 'Login'}
Type p685 = Record
  Header         : SHeader;
  Serial         : Array [0..03] of byte;// pode ser longint
  ID             : Array [0..31] of AnsiChar;
  Time           : LongInt;
  MacAddr        : Array [0..13] of byte;
  Version        : WORD;
  Null           : LongInt;
  Senha          : Array [0..31] of AnsiChar;
  Nulls          : Array [0..991]of byte;//talvez desnecessario
End;
{$ENDREGION}

{$REGION 'Message'}
Type p984 = Record //size 0x90 [144]
  Header  : SHeader;
  Null    : Byte;
  Type1   : Byte;//relacionado com tamanho
  Type2   : Byte;//tbm ou cor
  Null1   : Byte;
  ID      : Array [0..127] of AnsiChar;
End;
{$ENDREGION}

{$REGION 'ITEM STRUCT'}
Type TITEM=Record
  ID,APP    : WORD; //ID DOS ITENS
  Identific : LongInt; //PARECE IDENTIFICA��O DO ITEN
  EF       : Array [0..2]of BYTE; //EFEITO
  EFV      : Array [0..2]of BYTE; //VALOR EFEITO
  MIN, MAX  : BYTE; //DURABILIDADE MIN/MAX
  Refi      : BYTE; //REFI[1Byte]/LVL[1Byte]/(QNT[2 bytes])
  Unk       : BYTE; //BOOL Aumentar durabilidade ou �
  TEMPO     : WORD; // Licen�a/TEMPO PRA EXPIRAR
End;
{$ENDREGION}

{$REGION 'SendToWord'}
Type TQuest = Record
  ID : Word;
  Unk: Array [0..9] of byte;
End;

Type t925 = Record
  Header         : SHeader;
  AcountSerial   : LongInt;
  ClientID       : DWORD;
  Null_0         : DWORD;
  UnkNK          : DWORD; //talvez ID unico do char
  Nick           : Array [0..15]of AnsiChar;
  Unk_0          : Byte; //valor 5 talvez na��o
  Classe         : Byte;
  Null_1         : Word;
  For�a, Agilidade, Inte, Consti, Sorte, Status: WORD;
  Altura, Tronco, Perna, Corpo                 : BYTE;//07 77 77 Padrao
  CurHP, MaxHP   : DWORD;
  CurMP, MaxMP   : DWORD;
  Unk_1          : LongInt; //90 D1 DE 55 unk
  HonorPoint     : DWORD;
  KillPoint      : DWORD;
  Null_2         : Array [0..5] of byte;
  SkillPoint     : Word;
  Unk0           : Word; //Valor1
  Null_3         : Array [0..59] of byte;  /////////////////
  Unk1           : WORD; //Valor 52
  DNFis,DefFis   : Word;
  DNMag,DefMag   : Word;
  BonusDMG       : Word;
  null_4         : Array [0..9] of byte;
  Critico        : word;
  Esquiva        : Byte;
  Acerto         : Byte;
  Null_6         : LongInt;
  Exp            : Comp;
  LvL            : Word; //Level-1
  Null_7         : Array [0..153]of byte;
  Equip          : Array [0..15] of TITEM; //16 Itens
  Null           : LongInt;
  Inventory      : Array [0..59] of TITEM; //60 Itens
  Bags           : Array [0..03] of TITEM; //4 bolsas
  Gold           : Comp;
  UnkBytes0      : Array [0..383] of byte;  //Tem valores desconhecidos
  Quests         : Array [0..15]  of TQuest;
  UnkBytes1      : Array [0..595] of byte;  //Tem valores desconhecidos
  Senha2         : Array [0..3]   of AnsiChar;
  UnkBytes2      : Array [0..331] of byte;   /////////////////
  BarraSkill     : Array [0..24]  of DWORD;//Estranho valor e qtd [4bytes]
  UnkBytes3      : Array [0..619] of byte;  /////////////////
  PranNick       : Array [0..01]  of Array [0..15] of AnsiChar;
  Unknow         : LongInt;
End;
{$ENDREGION}

{$REGION 'SendToWord Pran'}
Type p907 = Record   //size 1276
  Header        : SHeader;
  Nick          : Array [0..15]of Ansichar;
  UNK1,UNK2     : DWORD;
  CurHP,MaxHp   : DWORD;
  CurMp,MaxMP   : DWORD;
  Exp           : DWORD;
  DefFis,DefMag : Word;
  UnkBytes      : Array [0..11] of byte;
  Equip         : Array [0..15] of TITEM; //16 itens
  Inventory     : Array [0..39] of TITEM;
  Bags          : Array [0..01]  of TITEM;
  Unk           : DWORD;
  NullBytes     : Array [0..39]of byte;
End;
{$ENDREGION}

{$REGION 'Pran ATK Recv'}
Type pran102 = Record   //size  280
  Header     : SHeader;
  SkillID    : DWORD;
  NullBytes0 : Array [0..11]of byte;
  Atacante   : Word;
  Null       : Byte;
  Effect     : Byte;
  NullBytes1 : Array [0..23]of byte;
  TargetID   : DWord;
  NullBytes2 : Array [0..11]of byte;
  TargetHP   : DWORD;
  PosX,PosY  : Single;
  NullBytes3  : Array [0..195]of byte;
End;
{$ENDREGION}

{$REGION 'Pran Effect in Player'}
type p117 = Record
    Header : SHeader;
    Index  : DWORD;
    Effect : DWORD;
End;
{$ENDREGION}

{$REGION 'NPC Request/Quiz/Altera o que ta em cima do NPC'}  //Solicita conversa
type p10D = Record
    Header : SHeader;
    Index  : DWORD;
    Effect : DWORD;
End;
{$ENDREGION}

{$REGION 'SendEffect Mob Header'}
Type p114 = Record
  Header : SHeader;
  Index  : DWORD;
  Effect : DWORD; //$15 = macro ca�a
  PK     : Boolean;
End;
{$ENDREGION}

{$REGION 'Pran Vida/Familiaridade'}  //Aumenta vida e familiaridade
type p96B = Record
    Header : SHeader;
    VIDA  : WORD;
    Familiaridade : WORD; // em %  porcentagem
End;
{$ENDREGION}

{$REGION 'Pran Animation/dance'}
type p304 = Record //20
    Header : SHeader;
    AnimationID  : DWORD;
    B            : LongBool;//Ou  bool
End;
{$ENDREGION}

{$REGION 'Atualiza Status DN'}
Type p10A = Record  //Size 0x2C(44) OPCODE 0x10A
  Header          : SHeader;
  DNFis, DefFis   : Word;
  DNMag, DEFMag   : Word;
  Null            : Array [0..5]of byte;
  SpeedMove       : Word;
  Unk             : Word;
  Null2           : Array [0..5]of byte;
  Critico         : Word;
  Esquiva,Acerto  : BYTE;
  Duplo,Resist    : WORD;
End;
{$ENDREGION}

{$REGION 'Atualiza Pontos'}
Type p109 = Record  //1c
  Header  : SHeader;
  For�, AGI ,
  INTE, CON ,
  SORT, STATUS: WORD;
  Null        : DWORD;
End;
{$ENDREGION}

{$REGION 'Atualiza Lvl e Exp'}
Type p108 = Record  //0x18
  Header  : SHeader;
  Lvl     : Word;
  Unk     : WORD;// CCCC
  Exp     : COMP;
End;
{$ENDREGION}

{$REGION 'Atualiza Info Na��o'}//Governo
Type p936 = Record  //160
  Header  : SHeader;
  LordMarechal : Array [0..19] of Ansichar;
  Estrategista : Array [0..19] of Ansichar;
  Juiz         : Array [0..19] of Ansichar;
  Tesoureiro   : Array [0..19] of Ansichar;
  UnkBytes     : Array [0..67] of byte;
End;
{$ENDREGION}

{$REGION 'Atualiza Info Na��o'}//Guilds Defensoras talvez
Type p91A = Record  //412
  Header  : SHeader;
  LordMarechal : Array [0..19] of Ansichar;
  Estrategista : Array [0..19] of Ansichar;
  Juiz         : Array [0..19] of Ansichar;
  Tesoureiro   : Array [0..19] of Ansichar;
  Null         : Array [0..319] of byte;
End;
{$ENDREGION}

{$REGION 'Atualiza HP/MP'}
Type p103 = Record  //0x20
  Header       : SHeader;
  CurHP, MaxHP : DWORD;
  CurMP, MaxMP : DWORD;
  Null         : DWORD;
End;
{$ENDREGION}

{$REGION 'ATT Lista amigo'}
Type p870 = Record  //0x28
  Header  : SHeader;
  Nick    : Array [0..15] of Ansichar;
  UnkBytes: Array [0..11] of byte;
End;
{$ENDREGION}

{$REGION 'Recv Lista de cartas'}
Type TStructCarta = Record
  Unk  : Dword;
  Null : LongInt;
  NickEnviado : Array [0..15] of AnsiChar;
  Titulo      : Array [0..29] of AnsiChar;
  DataRetorno : Array [0..15] of AnsiChar;
  UnkBytes    : Array [0..07] of byte;
End;

//0C 00 E1 32 08 00 11 3F 8E 95 29 8C   teste packet

Type p3F17 = Record
Header   : SHeader;
Null     : LongInt;
Cartas   : Array of TStructCarta;
End;
{$ENDREGION}

{$REGION 'Trade send'}
Type p317 = Record //size 240
  Header       : SHeader;
  Itens        : Array [0..9] of TITEM;
  Slots        : Array [0..9] of byte;
  Null         : Word;
  Gold         : Comp;
  Confirm      : boolean;
	Waiting      : boolean;
  OtherClientid: WORD;
  Null0        : LongInt;
End;
{$ENDREGION}

{$REGION 'CharList Packet 0x901 size: 336'}
Type TSizeChar = Record
  Altura  : Byte;  //TAMANHO
  Tronco  : Byte;  //TAMANHO
  Perna   : Byte;  //TAMANHO
  Corpo   : Byte;  //TAMANHO
End;

Type Item = Record
   Cabelo, Face ,
   Elmo  , Peito,
   Luva  , Cal�a,
   Arma  , Escudo : Word;
End;

Type TAtributos = Record
  For�a, Agiliade,
  Int  , Saude   ,
  Mana , Unk     ,
  Level : Word;
End;

Type Tchar = Record
  Nick            : Array [0..15] of ansichar;//16 letras
  Unk             : Word;  // N�o sei
  Classe          : Word;  //Classe do char   (Dinamitador...Pistoleira..)
  SizeofChar      : TSizeChar;
  Equips          : Item;
  Refi            : array[0..11] of byte; //
  Atributos       : TAtributos;
  NotUse          : array[0..5] of byte;
  Exp             : Comp; //pega 8 bytes
  Gold            : Comp; //pega 8 bytes
  NotUse2         : array[0..3] of byte;
  DeleteBOOL      : LongBool; // <>0 fica possivel deletar
  NumericErro     : Byte;    //Numero de vezes errada
  NumRegister     : BOOLEAN; //Se tem ou n�o numerica registrada
  NotUse3         : array[0..5] of byte;
End;

Type p901 = Record //Att CharList  Size: 336   recv
  Header          : SHeader;
  AcountSerial    : LongInt;
  Unk             : LongInt;
  NotUse          : array [0..3] of byte;
  Personagem      : Array [0..2] of Tchar;
End;
{$ENDREGION}

{$REGION 'Chat Send'}
type tF86 = Record //chat
    Header    : SHeader;
    NotUse    : Array [0..8] of byte;
    Typechat  : Array [0..3] of byte;
    Nick      : Array [0..15] of ansichar;//16 letras
    Fala      : Array [0..125] of ansichar;//126
End;
{$ENDREGION}

{$REGION 'PlayerSpam'}
Type zTPosition = Record
  X,Y : SIngle;
End;

Type t349 = Record   //Size 0x1FC  DEC: 508  PlayerSpam
   Header        : sHeader;
   Name          : ARRAY [0..15] OF Ansichar;
   Face,Cabelo,Elmo,Peito,Luva,Bota,Arma,Escudo : WORD;
   ItemEff       : Array [0..11] of byte;
   Pos           : zTPosition;
   Unk_0         : DWORD;//Null
   CurHP,CurMP,
   MaxHP,MaxMP   : DWORD;
   Unk0          : WORD;
   SpawnType     : BYTE;
   Altura,Cabe�a,Corpo : BYTE;
   UnkType       : Word;
   EffectType    : Word;
   Unk           : word;
   Buffs         : Array [0..59] OF WORD;
   UnkBytes      : Array [0..239] of byte;
   Title         : ARRAY [0..31] OF Ansichar;
   UnkBytes2     : Array [0..19] of byte;
End;
{$ENDREGION}

{$REGION 'MobSpam'}
Type t35E = Record   //Size 0x54  DEC: 84  MobSpam
    Header          : SHeader;
//    MobType         : Word;
    NotUse_0        : Array [0..15] of AnsiChar; // � string igual de NPC, infos no MobEffect
    unk_0           : longint;
    Posx            : single;
    PosY            : single;
    HP_1            : DWORD;
    notUse_1        : DWORD;
    HP_2            : DWORD;
    NotUse_2        : DWORD;
    Unk_1           : Word;
    Unk_2           : Word;
    notlister       : Array [0..23] of byte;
End;
{$ENDREGION}

{$REGION 'Recv ATK'}
Type t102 = Record    //Opcode 0x102 Size: 0x54 (84)
  Header          : SHeader;
  SkillID         : DWORD;
  PosX_1          : Single;
  PosY_1          : Single;
  NotUse_2        : LongInt;
  AttackID        : Word;
  Null            : Byte;
  Animation       : Word; //Deve ser a anima��o
  NotUse_3        : Array [0..10] of Byte;
  HPAtual         : Word;
  NotUse_4        : Array [0..9] of Byte;
  TargetID        : Word;
  DNType          : Word;
  DANO            : LongINT;
  NotUse_5        : Array [0..7] of Byte;
  MobCurrHP       : DWORD;
  PosX_2          : Single;//Se o mob morrer vem o valor da posi��o
  PosY_2          : Single;

  {
  72= hpcurr
  56 = MobID

  >> 54 00 9D 17 B0 00 02 01 BB C5 5F 5E
   00 00 00 00
 66 06 49 45 PosX
 9A D9 72 44 PosY
 00 00 00 00
B0 00  MyID
00 05 unk
00 00 00 00 00 00 00 00 00 00 00 00
76 04
 00 00 00 00 00 00 00 00 00 00
 B8 10 MobID
 00 1A tipo de dano
24 00 00 00 meu dano
 00 00 00 00 00 00 00 00
 48 01 curr HP
 00 00
00 00 00 00
00 00 00 00
  }
end;
{$ENDREGION}

{$REGION 'Criar personagem/ Deletar'}
Type t3E4 = Record  //0x3E4  size 0x38   [DEC 56]
   Header          : SHeader;
   AcountSerial    : LongInt;
   Slot            : DWORD;
   Nick            : Array [0..15] of ansichar;
   Face,Cabelo     : Word;
   Null            : Array [0..11] of byte;
   Local           : DWORD;
End;

Type p603 = Record  //deletar char
  Header          : SHeader;
  AcountSerial    : LongInt;
  Slot            : DWORD;
  Delete          : LongBool;//esse � longbool 4bytes
  Numeric         : Array [0..3] of Ansichar;
End;
{$ENDREGION}

{$REGION 'Receber/Atualizar Item'}
Type  pF0E = Record
  Header   : SHeader;
  Notice   : Boolean;
  TypeSlot : Byte;
  Slot     : Word;
  Item     : TITEM;
End;
{$ENDREGION}

{$REGION 'Movimento'}
Type p301 = Record //anda
  Header   : SHeader;
  PosX,PosY: Single;
  Null     : Array [0..5] of byte;
  TypeMove : Byte;
  SpeedMove: Byte;
  Unk      : DWORD;
End;

Type p305 = Record //angulo rato��o
  Header   : SHeader;
  Rota��o  : DWORD;
End;
{$ENDREGION}

{$REGION 'Skill'}
Type p320 = Record
   Header   : SHeader;
   SkillID  : DWORD;
   TargetID : DWORD;
   PosX,PosY: Single
End;

Type p302 = Record
  Header   : SHeader;
  TargetID : DWORD;
  Null     : Array [0..11] of byte;
  Effect   : Word;
  SkillID  : Word;
  PosX,PosY      : Single;
  TargetX,TargetY: Single;
End;
{$ENDREGION}

{$REGION 'Move Itens'}
type p70f = Record
  Header   : SHeader;
  OrigType,OrigSlot,
  DestType,DestSlot : WORD;
End;
{$ENDREGION}

{$REGION 'Separa Itens'}
Type p333 = Record
  Header   : SHeader;
  Slot, Qtd, TypeSlot : DWORD;
End;
{$ENDREGION}

{$REGION 'Usa Itens'}
Type p31D = Record
  Header  : SHeader;
  TypeSlot,
  Slot    : DWORD;
End;
{$ENDREGION}

{$REGION 'Janelinha sucesso decomposi��o item'}
Type p32E = Record //size 24
  Header  : SHeader;
  Type1,
  ItemID,Qntd    : DWORD;
End;
{$ENDREGION}

{$REGION 'Junta Itens'}
Type p332 = Record
  Header   : SHeader;
  OrigSlot,DestSlot : DWORD;
  Null : LongInt;
End;
{$ENDREGION}

{$REGION 'Atualiza gold'}
Type p312 = Record
  Header   : SHeader;
  Unk      : DWORD;
  Gold     : Comp;
End;
{$ENDREGION}

{$REGION 'Request NPC'}
Type p30F = Record
  Header : SHeader;
  Index  : DWORD;
  Type1  : DWORD;
  Type2  : DWORD;
End;
{$ENDREGION}

{$REGION 'Comerciante/Loja Item'}
Type p106 = Record
  Header  : SHeader;
  Index   : Word;
  SaleType: word;//Tipo de loja
  Item    : Array [0..14] of WORD;
End;
{$ENDREGION}

{$REGION 'Recv Bau Atualiza'}
Type p137 = Record
  Header : SHeader;
  Null   : LongInt;//Pode ser Tipo
  Gold   : Comp;
  Itens  : Array [0..79] of TITEM;
  Cofre  : Array [0..3]  of TITEM;
  Prans  : Array [0..1]  of TITEM;
End;
{$ENDREGION}

{$REGION 'Send Gold Bau'}
Type pF59 = Record
  Header : SHeader;
  Type1  : DWORD;
  Gold   : Comp;
End;
{$ENDREGION}

{$REGION 'MoveItemBar'}
Type p31E = Record
  Header : SHeader;
  Type1,Type2,Item : DWORD;
End;
{$ENDREGION}

{$REGION 'Senha Numerica'}
Type pF02 = Record
  Header        : SHeader;
  Slot          : DWORD;
  RequestChange : DWORD;
  Numeric_1     : Array [0..3] of Ansichar;
  Numeric_2     : Array [0..3] of Ansichar;
End;
{$ENDREGION}

{$REGION 'PK'}
Type p307 = Record
  Header : SHeader;
  Active : LongBool;
End;
{$ENDREGION}

{$REGION 'UnkPacket 0xD41'}
Type pD41 = Record  //size 512
  Header        : SHeader;
  AcountSerial  : LongInt;
  UnkBytes      : Array [0..495]of byte;
End;
{$ENDREGION}

{$REGION 'SendQuest Info'}
Type p331 = Record //ta meio errado
  Header : SHeader;
  ID     : WORD;
  Colect : Array [0..4] of Word; //relacionado ao completar cada parte
  Qtd    : Word; //quantidade
  Null   : LongInt;
  ColectID : Array [0..4] of Word;
  Terminat : Boolean;
End;
{$ENDREGION}

{$REGION 'NPC Option'}
Type p112 = Record
  Header : SHeader;
  Option : DWORD;
  Null   : LongInt;
  Message: Array [0..63] of ansichar;
End;
{$ENDREGION}

{$REGION 'XTrapCheck'}
Type p39D = Record  //send
  Header : SHeader;
  Active : LongBool;//ou boolean;
End;

Type pCCCC = Record //Recv
  Header : SHeader;
  Active : LongBool;//ou boolean;
End;
{$ENDREGION}

{$REGION 'UnkPacket  0x186'}
Type p186 = Record  //recv 4x apos logar antes sendtoword
  Header : SHeader;
  Nulls  : Array [0..127] of byte;
End;
{$ENDREGION}

{$REGION 'Client Request Delete Item'}
Type p32C = Record
  Header : SHeader;
  Slot,TypeSlot : DWORD;
End;
//Send envia o 0xF0E apagando o item do client, e o 0x33D(Unk)
{$ENDREGION}

{$REGION 'UnkPacket 0x33D incluso na atualiza��o de itens'}
Type p33D = Record
  Header     : SHeader;
  Null       : LongInt;
  Unk1       : DWORD; //valor 1
  NullBytes  : Array [0..19 ]of byte;
  Unk2       : DWORD;//Valor 8
  NullBytes2 : Array [0..7]of byte;
End;
{$ENDREGION}

{$REGION 'Send Pran Info'}
Type p1A1 = Record
  Header        : SHeader;
  Nick          : Array [0..15] of Ansichar;
  Fome          : Word;
  Personalidade : Word;
  Familiaridade : Word;
  CurrHP,MaxHP  : DWORD;
  CurrMP,MaxMP  : DWORD;
  Exp           : LongWord;
  DefFis,DefMag : WORD;
  Item          : Array [0..7] of TITEM;
  Null          : Byte;
  Vida          : Byte;
  Level         : Word; //lvl -1
End;
{$ENDREGION}

{$REGION 'Send Info Player'}
Type TStatus = Record
  For�a,Agi,
  Int,Consti,
  Sort,Stat,Critico : WORD;
  Esquiva,Acerto    : Byte;

  DMFis,DefFis : WORD;
  DMMAg,DefMag : WORD;
  SpeedMove    : DWORD;
  Resis,TxDup  : WORD;
  Null         : DWORD;
  Exp          : COMP;
  BonusDMG     : WORD;
  Level        : WORD; //lvl-1
End;

Type p19E = Record
  Header : SHeader;
  Nick   : Array [0..15] of Ansichar;
  Guild  : Array [0..19] of Ansichar;
  Unk    : DWORD; //acho que � na��o
  Honor  : DWORD;
  PVP    : DWORD;
  Status : Tstatus;
  Itens  : Array [0..15] of TITEM;
  PranName : Array [0..19] of Ansichar;
End;
{$ENDREGION}

{$REGION 'Send Request Info'}
Type p22C = Record  // se a index for 0 procura pelo nick e vice versa
  Header : SHeader;
  Index  : DWORD;
  Nick   : Array [0..15] of Ansichar;
End;
{$ENDREGION}

{$REGION 'Recv Loja Pessoal'}
Type TLoja = Record  //ta errado ainda
  Item : TITEM;    //talvez primeiro vem o gold/ depois o item e slot
  Gold : COMP;
  Slot : DWORD;
End;

Type p319 = Record
  Header     : SHeader;
  Index      : DWORD;
  Nome       : Array [0..31] of ansichar;
  CurrentGold: COMP;
  UnkBytes0  : Array [0..10] of byte;
  Itens      : Array [0..09] of TLoja;
  UnkBytes1  : Array [0..19] of byte;
End;
{$ENDREGION}


Const
 ExpList : Array [0..149] of Comp =
 (200,
538,
1171,
2294,
4142,
6992,
11164,
17025,
24988,
35514,
49114,
66350,
87839,
114252,
146316,
184816,
230596,
284563,
347686,
420998,
505598,
602652,
713397,
839140,
981260,
1141210,
1320518,
1520791,
1743714,
1991052,
2264652,
2566444,
2898445,
3262758,
3661574,
4097174,
4571930,
5088309,
5648872,
6256276,
6913276,
7622726,
8387583,
9210906,
10095858,
11045708,
12063832,
13153717,
14318960,
19427014,
22772422,
26441542,
30726982,
35642566,
41202118,
47419462,
54607942,
62788294,
71674822,
87169222,
93096262,
99704710,
107010694,
115647238,
125646598,
138053868,
152927110,
170064723,
189649760,
214930400,
267008518,
330462924,
407568876,
504140921,
644954086,
754105971,
875837696,
1010149261,
1157040666,
1347961511,
1679989393,
2045220063,
2446973800,
2888902911,
3375024933,
4128514067,
4889538092,
5658172357,
6434492964,
7218576777,
8010501428,
8810345325,
9618187660,
10434108418,
11258188383,
12090509147,
12931153118,
13780203528,
13780203528,
412240337041,
858993459200,
2718714298706,
7937099564131,
17918603561762,
34200824583909,
58411555236126,
92294552240980,
137713831405357,
196623602849380,
271111220679375,
363354233314912,
475646153292574,
610400752233263,
770121996071118,
957446994726481,
117510305243294E15,
142593343754109E15,
171290167748585E15,
203906149401538E15,
240759975286403E15,
28217935140794E15,
328503580182612E15,
380083989935312E15,
437280928422255E15,
500468057798281E15,
143684179568848E16,
184058246526394E16,
23878094025327E16,
308742865141674E16,
381673471431686E16,
254564429775782E16,
313789623517077E16,
429469241895671E16,
638800879879009E16,
841170934230876E16,
22367381367251E17,
3311675422304E17,
604787938617824E17,
522833777869817E17,
630893780672802E17,
142604889474107E18,
172551916182602E18,
208787818679732E18,
326857329959878E18,
33342716190445E18,
34012904777253E18,
346965640994912E18,
353939649977975E18,
361053836385689E18,
849050410);

// efeito Itens
None                                                             = 0;
EF_BLANK01                                                       = 1;
EF_DAMAGE1                                                       = 2;
EF_DAMAGE2                                                       = 3;
EF_DAMAGE3                                                       = 4;
EF_DAMAGE4                                                       = 5;
EF_DAMAGE5                                                       = 6;
EF_DAMAGE6                                                       = 7;
EF_RESISTANCE1                                                   = 8;
EF_RESISTANCE2                                                   = 9;
EF_RESISTANCE3                                                   = 10;
EF_RESISTANCE4                                                   = 11;
EF_RESISTANCE5                                                   = 12;
EF_HP                                                            = 13;
EF_MP                                                            = 14;
EF_STR                                                           = 15;
EF_DEX                                                           = 16;
EF_INT                                                           = 17;
EF_CON                                                           = 18;
EF_SPI                                                           = 19;
EF_RESISTANCE6                                                   = 20;
EF_RESISTANCE7                                                   = 21;
EF_REITERATION                                                   = 22;
EF_DELAY_ATTACK1                                                 = 23;
EF_REFLECTION1                                                   = 24;
EF_ANTI_SKILL                                                    = 25;
EF_CHECK_SKILL                                                   = 26;
EF_ADD_DAMAGE1                                                   = 27;
EF_CAST_RATE                                                     = 28;
EF_AMP_PHYSICAL                                                  = 29;
EF_AMP_MAGIC                                                     = 30;
EF_CRITICAL_POWER                                                = 31;
EF_MOUNT_CONCENTRATION                                           = 32;
EF_SKILL_ATIME9                                                  = 33;
EF_AMP_SKILL_DAMAGE                                              = 34;
EF_POLLUTION_RESISTANCE                                          = 35;
EF_SIEGE_LEVEL                                                   = 36;
EF_DRAIN_MP                                                      = 37;
EF_DELAY_ATTACK2                                                 = 38;
EF_UNIDENTIFIED                                                  = 39;
EF_POLYMORPH1                                                    = 40;
EF_POLYMORPH2                                                    = 41;
EF_AWAKEN                                                        = 42;
EF_DOT_TIMER                                                     = 43;
EF_HP_CHECK_PC                                                   = 44;
EF_ATK_MONSTER                                                   = 45;
EF_RUNSPEED                                                      = 46;
EF_RANGE                                                         = 47;
EF_COOLTIME                                                      = 48;
EF_DOUBLE                                                        = 49;
EF_CRITICAL                                                      = 50;
EF_PARRY                                                         = 51;
EF_BLOCKING                                                      = 52;
EF_HIT                                                           = 53;
EF_PER_DAMAGE1                                                   = 54;
EF_PER_DAMAGE2                                                   = 55;
EF_PER_DAMAGE3                                                   = 56;
EF_PER_DAMAGE4                                                   = 57;
EF_PER_DAMAGE5                                                   = 58;
EF_PER_RESISTANCE1                                               = 59;
EF_PER_RESISTANCE2                                               = 60;
EF_PER_RESISTANCE3                                               = 61;
EF_PER_RESISTANCE4                                               = 62;
EF_PER_RESISTANCE5                                               = 63;

EF_REGENHP                                                       = 64;
EF_REGENMP                                                       = 65;
EF_SKILL_DAMAGE                                                  = 66;
EF_SKILL_HP_DAMAGE                                               = 67;
EF_ATK_NATION2                                                   = 68;
EF_DEF_NATION2                                                   = 69;
EF_RECALL                                                        = 70;

//Skills
EF_SKILL_IMMOVABLE                                               = 71;
EF_SKILL_INVISIBILITY                                            = 72;
EF_SKILL_STUN                                                    = 73;
EF_SKILL_PROVOKE                                                 = 74;
EF_SKILL_DEATH                                                   = 75;
EF_SKILL_KNOCKBACK                                               = 76;
EF_SKILL_DISPEL1                                                 = 77;
EF_SKILL_DISPEL2                                                 = 78;
EF_SKILL_ABSORB1                                                 = 79;
EF_STATE_RESISTANCE                                              = 80;
EF_DASH                                                          = 81;
EF_SKILL_DIVISION                                                = 82;
EF_SKILL_DISPEL3                                                 = 83;
EF_SKILL_DISPEL4                                                 = 84;
EF_SKILL_DISPEL5                                                 = 85;
EF_PIERCING_RESISTANCE1                                          = 86;
EF_PIERCING_RESISTANCE2                                          = 87;
EF_SKILL_UNARMORED                                               = 88;
EF_CRITICAL_DEFENCE                                              = 89;
EF_ATK_ALIEN                                                     = 90;
EF_ATK_BEAST                                                     = 91;
EF_ATK_PLANT                                                     = 92;
EF_ATK_INSECT                                                    = 93;
EF_ATK_DEMON                                                     = 94;
EF_ATK_UNDEAD                                                    = 95;
EF_ATK_COMPLEX                                                   = 96;
EF_ATK_STRUCTURE                                                 = 97;
EF_DEF_ALIEN                                                     = 98;
EF_DEF_BEAST                                                     = 99;
EF_DEF_PLANT                                                     = 100;
EF_DEF_INSECT                                                    = 101;
EF_DEF_DEMON                                                     = 102;
EF_DEF_UNDEAD                                                    = 103;
EF_DEF_COMPLEX                                                   = 104;
EF_DEF_STRUCTURE                                                 = 105;
EF_AGGRO1                                                        = 106;
EF_AGGRO2                                                        = 107;
EF_AGGRO3                                                        = 108;
EF_AGGRO4                                                        = 109;
EF_SKILL_DOT_DAMAGE6                                             = 110;
EF_SKILL_DOT_MP                                                  = 111;
EF_REQUIRE_MP                                                    = 112;
EF_REQUIRE_MP0                                                   = 113;
EF_REQUIRE_MP1                                                   = 114;
EF_REQUIRE_MP2                                                   = 115;
EF_REQUIRE_MP3                                                   = 116;
EF_REQUIRE_MP4                                                   = 117;
EF_REQUIRE_MP5                                                   = 118;
EF_REQUIRE_MP6                                                   = 119;
EF_REQUIRE_MP7                                                   = 120;
EF_REQUIRE_MP8                                                   = 121;
EF_SKILL_ATIME6                                                  = 122;
EF_SKILL_RESURRECTION                                            = 123;
EF_DUR_RATE                                                      = 124;
EF_DURABILITY                                                    = 125;
EF_UNBREAKABLE                                                   = 126;
EF_RANDOM_MIN                                                    = 127;
EF_RANDOM_MAX                                                    = 128;
EF_STOP_REGEN_HP                                                 = 129;
EF_STOP_REGEN_MP                                                 = 130;
EF_CRITICAL_STUN                                                 = 131;
EF_ATK_DIVINE                                                    = 132;
EF_DRAIN_HP                                                      = 133;
EF_TARGET_FIX                                                    = 134;
EF_ANTI_MAGIC                                                    = 135;
EF_TRANSFER                                                      = 136;
EF_TRANSFER_LIMIT                                                = 137;
EF_REACTION                                                      = 138;
EF_CHANGE                                                        = 139;
EF_SILENCE1                                                      = 140;
EF_SILENCE2                                                      = 141;
EF_HP_CONVERSION                                                 = 142;
EF_MP_EFFICIENCY                                                 = 143;

EF_HP_CHECK                                                      = 144;
EF_REQUIRE_MPA                                                   = 145;
EF_RELIQUE_PER_HP                                                = 146;
EF_RELIQUE_PER_EXP                                               = 147;
EF_RELIQUE_PER_MP                                                = 148;
EF_RELIQUE_PER_DAMAGE1                                           = 149;
EF_RELIQUE_PER_DAMAGE2                                           = 150;
EF_SKILL_SHOCK                                                   = 151;
EF_SKILL_BLIND                                                   = 152;
EF_SKILL_SLEEP                                                   = 153;
EF_DECURE                                                        = 154;
EF_POINT_DEFENCE                                                 = 155;
EF_REFLECTION2                                                   = 156;
EF_MPCURE                                                        = 157;
EF_SPLASH                                                        = 158;
EF_UNARMOR                                                       = 159;
EF_HIDE_LIMIT                                                    = 160;

EF_HP_LIMIT                                                      = 161;
EF_SUMMON                                                        = 162;
EF_CAST_SPELL                                                    = 163;
EF_ANTICURE_COUNT                                                = 164;
EF_ANTICURE                                                      = 165;
EF_MASS_TELEPORT                                                 = 166;
EF_DELAY_DAMAGE6                                                 = 167;
EF_DISPEL_BUFF                                                   = 168;
EF_BREAK_BUFF                                                    = 169;
EF_DISPEL_ALL                                                    = 170;
EF_REFLECTION3                                                   = 171;
EF_REFLECTION4                                                   = 172;
EF_FAIRY_FORM                                                    = 173;
EF_RELIQUE_SKILL_PER_DAMAGE                                      = 174;
EF_RELIQUE_SKILL_ATIME0                                          = 175;
EF_RELIQUE_ATK_NATION                                            = 176;
EF_RELIQUE_DEF_NATION                                            = 177;
EF_RELIQUE_ALL_ABILITY                                           = 178;
EF_SELFHP_LIMIT                                                  = 179;
EF_CALLSKILL                                                     = 180;
EF_INITCOOLTIME                                                  = 181;

EF_PRAN_DAMAGE1                                                  = 182;
EF_PRAN_DAMAGE2                                                  = 183;
EF_PRAN_HP                                                       = 184;
EF_PRAN_MP                                                       = 185;
EF_PRAN_RESISTANCE1                                              = 186;
EF_PRAN_RESISTANCE2                                              = 187;
EF_PRAN_CRITICAL                                                 = 188;
EF_PRAN_SKILL_DAMAGE                                             = 189;
EF_PRAN_SKILL_ABSORB1                                            = 190;
EF_PRAN_REGENHP                                                  = 191;
EF_PRAN_REGENMP                                                  = 192;
EF_PRAN_PARRY                                                    = 193;
EF_PRAN_REQUIRE_MP                                               = 194;
EF_PRAN_STATE_RESISTANCE                                         = 195;
EF_CHAOS                                                         = 196;
EF_TYPE45                                                        = 197;
EF_RELIQUE_CRITICAL                                              = 198;
EF_RELIQUE_HIT                                                   = 199;
EF_RELIQUE_PARRY                                                 = 200;
EF_RELIQUE_DOUBLE                                                = 201;
EF_RELIQUE_STATE_RESISTANCE                                      = 202;
EF_RELIQUE_ATK_MONSTER                                           = 203;
EF_RELIQUE_DEF_MONSTER                                           = 204;
EF_RELIQUE_LEVEL_UPGRADE                                         = 205;
EF_BLANK03                                                       = 206;
EF_BLANK04                                                       = 207;
EF_DISPEL_RANDOM                                                 = 208;
EF_RELIQUE_PER_RESISTANCE1                                       = 209;
EF_RELIQUE_PER_RESISTANCE2                                       = 210;
EF_RELIQUE_DROP_RATE                                             = 211;
EF_RELIQUE_COOLTIME                                              = 212;
EF_RELIQUE_RUNSPEED                                              = 213;
EF_SKILL_DAMAGE6                                                 = 214;
EF_DAMAGE_SWARM                                                  = 215;
EF_ANTI_SWARM                                                    = 216;
EF_SKILL_CRITICAL                                                = 217;
EF_AFTEREFFECT                                                   = 218;
EF_PARALYSIS                                                     = 219;
EF_SUMMON_TARGET                                                 = 220;
EF_WEAPON_GUARD                                                  = 221;
EF_BATTLE_REGENHP                                                = 222;
EF_DAMAGE7                                                       = 223;
EF_BATTEL_RENEGADE                                               = 224;
EF_SUICIDE                                                       = 225;
EF_FEAR                                                          = 226;
EF_BATTLE_DAMAGE1                                                = 227;
EF_BATTLE_DAMAGE2                                                = 228;
EF_BATTLE_HP                                                     = 229;
EF_BATTLE_MP                                                     = 230;
EF_BATTLE_RESISTANCE1                                            = 231;
EF_BATTLE_RESISTANCE2                                            = 232;
EF_ABSOLUT_DAMAGE6                                               = 233;
EF_UPCURE                                                        = 234;
EF_FREEZE                                                        = 235;
EF_PULL_TARGET                                                   = 236;
EF_GUARD                                                         = 237;
EF_GUARD_RATE                                                    = 238;
EF_PROMESSA                                                      = 239;
EF_ULTIMATUM                                                     = 240;
EF_SNIPING_STANCE                                                = 241;
EF_IM_RUNSPEED                                                   = 242;
EF_IM_SKILL_IMMOVABLE                                            = 243;
EF_BLOODYROSE                                                    = 244;
EF_DEAD_LINK                                                     = 245;
EF_IM_SILENCE1                                                   = 246;
EF_IM_FEAR                                                       = 247;
EF_IM_SKILL_STUN                                                 = 248;
EF_IM_SKILL_SHOCK                                                = 249;
EF_IMMUNITY                                                      = 250;
EF_PROMESSA_LINK                                                 = 251;
EF_MARSHAL_PER_HP                                                = 252;
EF_MARSHAL_PER_MP                                                = 253;
EF_MARSHAL_ATK_NATION                                            = 254;
EF_MARSHAL_DEF_NATION                                            = 255;
EF_BREAK_ANTI_MAGIC                                              = 256;
EF_DAMAGE_TO_HP                                                  = 257;
EF_2SEC_RANDOM_COUNT                                             = 258;
EF_SKILL_CALLSKILL                                               = 259;
EF_DEATH_LIFE                                                    = 260;
EF_ABSOLUT_DAMAGE                                                = 261;
EF_SUMMON_MOUNT                                                  = 262;
EF_SUMMON_LOCK                                                   = 263;
EF_LIMIT_HP_UP                                                   = 264;
EF_INITSKILL                                                     = 265;
EF_BUFF_CONSERVATION                                             = 266;
EF_DOUBLE_HONOR_POINT                                            = 267;
EF_PER_HP                                                        = 268;
EF_PER_MP                                                        = 269;
EF_REDUCE_AOE                                                    = 270;
EF_BLANK15                                                       = 271;
EF_BLANK16                                                       = 272;
EF_SPEND_MANA                                                    = 273;
EF_COUNT_HIT                                                     = 274;
EF_AMP_PARALYSIS_ATTACK                                          = 275;
EF_SKILL_ABSORB2                                                 = 276;
EF_AMP_SKILL_DAMAGE6                                             = 277;
EF_PREMIUM_PER_EXP                                               = 278;
EF_HEADSCALE                                                     = 279;
EF_PC_PREMIUM_PER_EXP                                            = 280;
EF_SKILL_DOT_PER_HPCURE                                          = 281;
EF_NPC_ACCESS_DENIED                                             = 282;
EF_PARTY_PER_DROP_RATE                                           = 283;
EF_SPI_PER_MP                                                    = 284;
EF_ACCELERATION1                                                 = 285;
EF_ACCELERATION2                                                 = 286;
EF_ACCELERATION3                                                 = 287;
EF_IMPACT1                                                       = 288;
EF_IMPACT2                                                       = 289;
EF_IMPACT3                                                       = 290;
EF_LEGION_PER_EXP                                                = 291;
EF_LEGION_RATE_EXP                                               = 292;
EF_LEGION_BONUS_EXP                                              = 293;
EF_HONOR_PLUS                                                    = 294;
EF_RVR_EXP                                                       = 295;
EF_LEGION_DOT_PER_HPCURE                                         = 296;
EF_LEGION_DOT_PER_MPCURE                                         = 297;
EF_LEGION_DOT_TIMER                                              = 298;
EF_LEGION_MEMBER_HP                                              = 299;
EF_LEGION_MEMBER_LIMITEHP                                        = 300;
EF_LEGION_MEMBER_MP                                              = 301;
EF_LEGION_EXPLOITPOINT                                           = 302;
EF_LEGION_DECREASE                                               = 303;
EF_SWAP_AGGRO                                                    = 304;
EF_MANABURN                                                      = 305;
EF_REDUCE_CRITICAL_DAMAGE                                        = 306;
EF_PARTY_PER_DAMAGE6                                             = 307;
EF_LEGION_MEMBER_LIMITEMP                                        = 308;
EF_HP_BASE_DAMAGE                                                = 309;
EF_IMMUNITY_AFFECT                                               = 310;
EF_KILLING_RESTORE_HP                                            = 311;
EF_KILLING_RESTORE_MP                                            = 312;
EF_INSTANT_DEATH0                                                = 313;
EF_INSTANT_DEATH5                                                = 314;
EF_HP_MARK                                                       = 315;
EF_MP_MARK                                                       = 316;
EF_DECREASE_HP_DAMAGE                                            = 317;
EF_DECREASE_HP_DAMAGE_LIMIT                                      = 318;
EF_DECREASE_PER_DAMAGE1                                          = 319;
EF_DECREASE_PER_DAMAGE2                                          = 320;
EF_CREATE_ITEM                                                   = 321;
EF_DECREASE_PER_HP                                               = 322;
EF_DECREASE_PER_MP                                               = 323;
EF_DECREASE_PER_RESISTANCE1                                      = 324;
EF_DECREASE_PER_RESISTANCE2                                      = 325;
EF_DOUBLE_DAMAGE_PC                                              = 326;
EF_LEOPOLD_ATK_NATION                                            = 327;
EF_LEOPOLD_DEF_NATION                                            = 328;
EF_DEBUFF_ADD_DAMAGE                                             = 329;
EF_INITCOOLTIME_AGGRESSIVE                                       = 330;
EF_SILENCE_CURE                                                  = 331;
EF_SKILL_SELFSKILL                                               = 332;
EF_CLEAR_DAMAGE                                                  = 333;
EF_VISUAL_EFFECT_LINK                                            = 334;
EF_MONSTER_SUMMON                                                = 335;
EF_QUESTEXP_UP                                                   = 336;
EF_FISHING                                                       = 337;
EF_PRAN_EXP_UP                                                   = 338;
EF_IM_SLEEP                                                      = 339;
EF_ABSOLUTE_ZERO                                                 = 340;
EF_PRAN_DOUBLE                                                   = 341;
EF_CHECK_HP_DAMAGE                                               = 342;
EF_FILTER_HP_DAMAGE                                              = 343;
EF_ATK_BOSS                                                      = 344;
EF_DEF_BOSS                                                      = 345;
EF_SKILL_DOT_DAMAGE1                                             = 346;
EF_SKILL_DOTA_DAMAGE1                                            = 347;
EF_SKILL_DOTB_DAMAGE1                                            = 348;
EF_SKILL_DOTC_DAMAGE1                                            = 349;
EF_SKILL_DOTD_DAMAGE1                                            = 350;
EF_SKILL_DOT_DAMAGE2                                             = 351;
EF_SKILL_DOTA_DAMAGE2                                            = 352;
EF_SKILL_DOTB_DAMAGE2                                            = 353;
EF_SKILL_DOTC_DAMAGE2                                            = 354;
EF_SKILL_DOTD_DAMAGE2                                            = 355;
EF_BODYSCALE                                                     = 356;
EF_BLOOD_SPEND                                                   = 357;
EF_DECEIVE_ATK                                                   = 358;
EF_DECEIVE_DEF                                                   = 359;

EF_MP_BASE_DAMAGE                                                = 360;//////////
EF_PER_CURE_PREPARE                                              = 361;
EF_PER_CURE_ACTIVATE                                             = 362;
EF_PREMIUM_PER_EXP2                                              = 363;
EF_ART_PER_HP                                                    = 364;
EF_ART_HP_PER_DAMAGE1                                            = 365;
EF_ART_SKILL_PER_REDUCE                                          = 366;
EF_ART_RES1_PER_DAMAGE1                                          = 367;
EF_ART_DD_SKILL_PER_HEAL                                         = 368;
EF_ART_AOE_PER_AMP                                               = 369;
EF_ART_CRITICAL_PER_DOUBLE                                       = 370;
EF_ART_DEX_TO_DAMAGE1                                            = 371;
EF_ART_PER_MP                                                    = 372;
EF_ART_MP_PER_DAMAGE2                                            = 373;
EF_ART_MP_PER_SDAMAGE6                                           = 374;
EF_ART_INT_TO_DAMAGE2                                            = 375;
EF_CONSERVATION_HONOR_POINT                                      = 376;
EF_PER_RESISTANCE11                                              = 377;
EF_PER_DAMAGE11                                                  = 378;
EF_PER_HP_MP                                                     = 379;
EF_STR_DEX_INT                                                   = 380;
EF_CRITICAL_DROP                                                 = 381;
EF_STANCE_LIMIT                                                  = 382;
EF_TARGETHP_PER_DAMAGE                                           = 383;
EF_REFLECTION5                                                   = 384;
EF_REFLECTION6                                                   = 385;
EF_DUNGEON_BOSS_PER_DROP_RATE                                    = 386;
EF_MULTIPLE_EXP4                                                 = 387;
EF_SUMMONGEN                                                     = 388;
EF_PER_HONOR_POINT                                               = 389;
EF_MENTOR_GUILD                                                  = 390;
EF_REVIVE                                                        = 391;
EF_REVIVEPLUS                                                    = 392;
EF_FEARPLUS                                                      = 393;
EF_DUNGEON_ON                                                    = 394;



implementation


end.
