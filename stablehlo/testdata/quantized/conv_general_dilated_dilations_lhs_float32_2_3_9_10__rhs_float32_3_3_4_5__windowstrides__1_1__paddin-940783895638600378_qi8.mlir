// RUN: stablehlo-translate --interpret -split-input-file %s

module attributes {jax.uses_shape_polymorphism = true} {
  func.func @main() -> tensor<i1> {
    %cst = stablehlo.constant dense<"0x3F5BA23F27D05840394C02405401C9407C5926C02A656AC0977F6940E6B2C03DD7DFF43A7A8F25BF7B17C7BF816F3CC0161D16C05D70C8408C1B42C0BAA6813F76161F406F1D40401AF8C23F9BBA86C090387ABD1A6B11BEB1C28640B9A94DC00F7E5C3ECCAC30BF847D883E0D586040F7C8923FB5522D40F28A2A40C9C683C0CB871F3FD35F943E12D18C40374F5440910D92C0B619E04076C39FBF82696D406D58023F2A1A7C40F5EA34C03384B73D21013D4090BF8740BD321DC0161CA8BFF87490406166DEBF9BC0B8BDE69FA83F37E3CDBE7560893F98594DC0B82F6ABFB7CA9B403E4423C1E2ED59C0C71471BF5C65A540F847503DB35B72409E36994070B4F0C04969A5C0C1DAA0406C77233EA75DF9BF894A5140480F98C0C5B36040DA2A13C08F963840951D273E82464B3F5E97273FFD2FEEBE8A0831C08B55853F84F706BF238DDD3F4650B5C0C9F992C0FA244D3FDAF85AC0EC82F03E6B8086C018A32E40767620C012A140C0661309403083C03FC911A540EE16483F701F76C0A5DE79C0721C9C40B7B248409F6672BF5214EABFF81A3BC00ED39BC0988745C0FB3F73BF569664C0D725BC4005A8C63FB6F0163FDD7C1EC09A6DBD3E5F172E40DED5ACBFA82FAD3F5682443EC2091640926D94C0199F964073E8793F7E70A6BE0B1334C0C4B61DBFF5C9A63FDEAD3F3F76F19B40A0DDC73F7E91AE3FE5C2B1BF16B62AC0A84C5C40063FD93ED4906840FCAF9D4009F84EC0BD58594023064D40D55BBB4032E546C01BD9043F68AB314043596ABEE34F81402FAD44C08C50E2BE9F9F4C3F84CC7540F623DEBFAFBF9FC0F7ABE33F8272293F32CEECBE071E8CC0784D87C0EF50683D994C6EBF60C775C00DCAA43BD767453E15EAA9BF82550340E4C35EC0648F72C0F119A03FAB4C7AC08DB046C05BD78E400C37163F03F30ABFABA993C08DCF41C07BD58E4014F56A40A8C662400BA089C0528F9E4021BC673FDCCA5840EF491A3FE8878A3FBB44423F59C945BF3381A8BE64D390C0DC466B3FED28F83EAA2E89C0F5649B40710BD5BF34C12B40E84994BF5E8A3B3CEE7680BE059961C057AF853E055CDB3FE5035AC08BB5C7BFA7DFB540289F3F40CCC5383F379F8B40FFCB2ABFBBA0883EE00496406C3FD5BF4B0F94C0737D0FC0EE47F3BE55B4D93DF16FCBC0201DDB3F9E9872C0F1A20140548CEE4053E2B53F0ACD1D40486D36400F40143FB5FA1E3F6B728340F15E0FBED6B90CC0A3A6D73E8451D9BF70EF0FC0D4C58E3D9E10C7BFADA2063F6A8F18BEF4D5B9BF9FF8C7BD9B2BD33D5D6B8B40062DCF3FFEC26CBFE3B69340774143BFC98AA63F56641CC0AC7F94402AED39C058AD16C04D69B3404B4420C0AD7F8AC0A6B82DC0E1DA58C0DE571B4050188040D184A63FF01E9E40B6AD23BF1C7B963EAF101F401E72D4BF842A7E3FBBB0A7BF8A01FC3E7A8F843F58AA38BF0580E4BFF2DF5CC01FD25C3E3B824140F4C3E4BEDAEA8D40CE318F40B39164406A3903409254423FECE86740F9064540B6ACACBFAAA24C41DF553740F5762340C384223EAB9B1EC08AB205C04BA76E40EEC2653ECB5228C0156785C0E10481BF6F4A60BF1CE605C02693AF3F022022C0B311053F9FD1BBBD699ED9BF3782BD3F715073C098DB803FE24807412EDB303FE860723F640287BE0D46343FC5F57CC012BCCB3FC3052D4098DA83404E15D43E998AB53FE084EEC0CE36143DCD846A408B951FBFD2D29E3E1CD1834054CA3B40005939C09CA915C0B67982403345073F4A45F33F491DD3BFCDEF0A4072146840BFEDCD3F93FB15407FA508C09CD9803FFC7B03404A29933FF26BED3FB94CBB3FD990C1C04C9B21C0D08106BF7A5089402EC01741059F01C0BE90C8BFE03A6B3E3A36953F19FBC23F2930453F6A101C3FA14A974026F09ABE615D99BDB7920C3F99D0EC40EDD182C03E861BC0493C0F408841F2BF33AB2C40172429408218873F8C5E4DC01E0C6ABDC8CB9140201B033E6753A3BD2EBE12C09C1A4540511BCABE44E953C07D3546C0A66217C01C60814022E596BF42596EBF64839AC0E07DE83F632B043FED3F62BD4F0B1340FD86104049A28140C0A7AF4021FEF7BED0D46040B2F7274031F59DBFD298F83F025605C099439B3DA98F993F739EEA3F48010D4084B1263F4C7200BFF7DD7B3F313130C0D48D953ED96D6BC090CB48BE671C9740C021AB3FEBFF713E500921C0322B08C0B68431C06EE48AC0EC73A63E759D05C0E9B184C0F7C104C08CCC6E40DC57C73F6AF5D44085598F40DEF44740B3148340DE2646C06B67F6BF1BECEB3F998FBA3FB07C974091C9A13ED8541540114A6DBF34532CBE2D3DB740710B4A40FDCA85C027605240F0DB7FBD3F805CC0DA5938C090D2BEBF86799CBF8D149C40A03C1FC08B18B2C0DB2BE3BFFE7BB9C002EF90C0673A80C0BEFEB13F3F377E40684151C029814F40A5F792403F001CC0598E653F3C8129C09BDAB9BD3784A7C0EA9AD53F710A9C3FF1350940D47082C0E57E9CC07E5AD0BFB8DE43BFD2D7B23FEB4F993EAB5149C0F691523F3467073DD91E573E78F5C3BFE721933F1137E0BECFE3C2BD4592623F7D00B740B46EC13FA16127C00581043E0B9BC03FDC6E95BD4A5C1F40CC592840C8264E40375A044067CA23BD360938C067A6283E35909540A2930C3FE88489BF697B023F5CF4CA40937ABABE634AAD4080E07C40389F3CC0FACB164053250E409A17E53F3D7D9B3FE3920FC0E5ABE93F6F1F4A4073619B3F8564C63F6CEC84BFE7B495C00F80A83FC3C86540109BD340657A433E3894564032D62A3F2DD3F3BE9EF24740971139BDCFBE6540F8B77540356DD8407B4892C07209823EF8E17D3D85F0293E90A780C0F5018F3E8E15CE3F43869F40ACFF693F7C43DBBDC819CBC016EA02405630C33F0DC7EEBFCD525EBE0D4A834079FFA7BE7DB98E3DC7C695C09E110A3FEC231B40340B9CBE0740B63F2D9F23404F822FBEA378E73D02D7A0C0F8CDE3BDB9632C402F3205C06C1B0C402F813C3FC6BAE63FB1BF42C0"> : tensor<2x3x9x10xf32>
    %cst_0 = stablehlo.constant dense<"0xF433F4BF96FAFF3F1B4D4AC04306B740402C003F86533540C40886C08C1DC84038ABB53F721424BF2BBD3E3FD8FD073FE24491BF9E6CD240AFB2813E369F3E3F90730EC0A9542540417C0240243FB43F5D72E9BE39C353C021CAE5BDA3352A3FA8AE0DC0B5B390C050923F40112A6D404A03ADC0B51312BE4AA07F40A25F4BBE620285C0CC050A3FAB675D4040C51040A7BF97C0F8BEB03F030EAA4061A5EE3FF28F48BFE9343040C54E41C0B6D80B40E7D9913F0B043EBF4437B7BED9C3964028D4954093477CC0A67E40C02D2A863D3BDA9E40DFFC60BFB174A2408AE16E40C520584034A791BF53026B400B3B5C40DCDFAAC0F7534B40EBA81040D76F0E41C19108C0D02200402A6B72BF86D117C0F2049CC0AA34AEBF72983D40A2E569C042BC034176F9903EB8E538C00ADB0B4067E309407C4CB0C004DD5B3FB4871D4030728EC000DC02C03259E83D116E93C028FF873E1E8BF2BFE1AA7840ED802540C904B8405C396A3E6B3D6EC0D13F34400D00FE3D53106A409CC53B40E9DCF1BE06180B40D16F51BF7A0ABEC0B1BECE3FD31C243F0E1E2F40C1C12E408D606BBF91B6813F782CEDBFEE55F5BF6BEF62C04D7082C0D8244E4091C2403FB0C1623FC4BCDA405D4607BF0B236AC0822D8FBFED750EBF5BC48CBE761977BF980F19C009A73DC03EEE17BF017B34BCEC7D843DD697BBBD689315C051FE67C060C49ABEA064EE3F9419993F0D9168BEFCB18F403D351F4084544F4016A2A54028CE61BFD1CC61C06B44EE4092AB2B40261FAEBFBE9CB2BFC7C8D740A7F7B63FC5F4CF3FE6C253C0ABBB533FEDF08C3F7C3881BFA62A673ED351F240E2A8B0BD024F6CBE0587CBBF2D5281BE78C767BDD98ECCC03FEF4AC02E31CAC0BBCB87C0A4A701C1DE0F7FBF80BBA9BFCAACF7BE59C5A8BF3937A6BFA40C134020E89ABF80AA48BF48725CC0F09286C0C979C0C070A89FC0394522C09349363F2C79A53F0E9D8FBF6F034CBFBFBCB7BFE363AA3BE4B4AB3E"> : tensor<3x3x4x5xf32>
    %cst_1 = stablehlo.constant dense<"0x0998043F84292A403482F73F4FF59240DD68E13F21335F40922C00400EE4C63FB7CA30404E6282409678424060B19A407300B340CC3F6A4065FD5C40110A68405088A33F922C8040DD68614088756C4060B11A401D7AAD40922C0040C8F327405088A33FECFEC740B637A04009980441726DA2407825054155D4653F922C803F70478140E9451640DA42404084292A40D81C1F4084292A4044AB6E3F63D73B4000E170406244AB409678424020A0CE402F3635406244AB401CE79C40FA019E40704781408AE10C41EAD8A6408875EC40E7B28540453EFF40810389407300B34055D4654063D7BB40762654406690ED40CC3F6A4060B11A40784C7540922C804060B19A400EE44640C5CD8640DA4240403ECC9B402F36B53F4E628240DA42404073003340762654402B7D8340EAD8A64096784240FB94AE407300334030C9C540A47B98406690ED40726DA240ACC60B4152AE4440864FCB400EE446402B7D834084292A400B2B9540DD686140315C5640315C5640DD68614000E17040B7CAB040A7A139400F77D740BC167340C7609740315C56400CBE2540A7A13940DD686140D81C1F40B7CAB04094522140ECFEC7404E628240A7A13940730033407626D4404E62824063D7BB40DA424040DA42C0409452214071DA1140DA4240400CBEA5409678C23FC8F3274070478140864FCB3F2D1014407300334076265440BAF051400998044073003340945221408103893FFEBA4F40D81C1F407626D43F1CE79C40922C80402B7D83407047814082969940000000000CBE254055D4E53FDA424040DA424040315C5640E94516402B7D8340922C00408429AA40DA424040CA194940EB6B37402D1094409678423F52AE444055D4E53F7626D43F9678423FDA424040B5A40F4073003340B7CA3040CC3FEA3F71DA91403D398B40BAF05140A7A1B940BAF0514093BF904060B19A3F0D51B64073003340CA194940FEBA4F408429AA407626D43FF96E8D403F5F2C4084292A40730033400EE4464073003340704781404E620240DD68E13F63D73B402F36B53FA47B18401CE71C40864F4B40C8F32740999E6340F96E0D40B7CA3040EAD8A6409678C23FB85DC140C5CD8640B637A0401F0D3E4063D7BB4088756C408908FD405088A340FF4DE04088756C40999EE340B637A0407493C340B7CAB03F922C00402D10144071DA114067237E4081030940315C56407626D43F4E62824071DA11403F5FAC401B548C4085BCBA40EB6B3740FA019E40922C803F44ABEE3F5088A33F922C803F60B11A40E945963F922C00407626D43EA7A1393FB5A40F40EAD8A640CA1949403F5FAC40D7898E405F1E8A4055D4653F5088A33F94522140B5A40F40A47B9840A9C75A40864F4B40864F4B40B5A40F4052AE4440CC3F6A40BAF05140511BB440C8F3A7402F36B540F0B779409678C23F71DA1140EB6B37400B2B954052AE44403F5F2C407047814042854D40DA424040B5A40F40EB6B3740864FCB3F1F0D3E40D81C9F4000E170403D390B409452A14067237E405088A340099884408429AA40ED915840B637A040CA194940A9C75A40A9C75A40BC167340945221408103894044AB6E40DA424040FEBA4F402F3635404FF592403F5F2C404FF592403ECC9B40EAD8A640922C804055D46540922C00408103094065FD5C3F42854D4071DA9140C8F32740B5A48F4076265440E9459640999E6340ECFEC740A60EA94033EFE6404E628240DD686140DA424040348277402F363540C760974081030940922C8040922C804044ABEE3F0998843F922C0040ED9158407300334042854D403482774094522140922C0040C5CD06400998043F2F36B53F96784240C5CD0640C8F32740ED91D83FE7B28540B7CA30405F1E8A40BC1673400CBE2540FEBA4F401CE71C4000000000CC3F6A40A9C75A4042854D40922C8040BC16F33F0EE4464044ABEE3FE945963F44ABEE3F7047814055D4E53F922C004044ABEE3F3F5FAC3F71DA913FB5A40F403F5FAC3F5F1E8A40BAF05140B7CAB03FE7B2854042854D40511BB44009980440DA42404000000000F96E8D3F71DA1140784C7540D81C9F3F65FD5C400998044060B19A40DA424040922C803F09980440BC16F33F60B19A3F60B19A3FBC1673407626543F2F36B53FE9451640CC3FEA3FA7A1B93F2F3635407626543EA47B1840BC1673404E620240A9C75A4071DA9140348277403482F73FA7A1394060B19A3F84292A40CC3F6A405F1E8A40DD68E13F76265440864FCB3F810389409678C23FDA424040922C8040922C004055D4E53FB7CA303FCA19494073003340999E6340A7A13940D81C1F40099804402B7D8340A7A1B93F9678423F922C803F0998044071DA1140FEBA4F40DA42404021335F4055D4E53F55D4E53F922C004009980440DA42404044AB6E40922C8040E9459640FB942E407626D43D922C803FE9451640922C803F000000007626543E1F0DBE3F922C803FDA4240401F0DBE3F71DA114042854D4065FD5C40CA1949402F3635405088A33FE945963F922C0040DD68E13F7626543E7626543E7626543EF96E8D3EF96E8D3EC8F3A73F71DA1140762654400EE4464044AB6E400CBE254084292A40C8F32740730033400998043FC8F3A73F71DA1140E7B285402F36B53FDD68E13F5088A33F96784240B5A40F40864F4B40F96E0D403D390B40C8F32740A47B1840BC16F33FC8F32740BAF0514042854D40864F4B40F0B77940DA424040FB942E40864FCB3FD81C1F40C8F3274021335F401F0D3E4000E1704065FD5C3F0998843F0EE4C63FF0B779401F0D3E402D10944042854D40784C7540D81C9F3FDA424040922C0040CC3FEA3F922C803F55D465402F36B53FE9451640F96E8D3F44ABEE3FCC3FEA3FA7A1394052AE44402B7D8340922C0040DA4240409678C23FA7A1B93F922C803F922C803F922C803F3F5F2C40D81C9F3FD81C9F3FC5CD0640A3E88740D81C9F3FE9451640B5A40F40CC3FEA3FB5A40F40B5A40F40922C803FE9451640F96E8D3F44ABEE3FDA42404044AB6E40DA424040FB942E40922C803F09980440922C0040B7CA3040922C0040DA424040DA424040FB942E4000000000E945163F9678C23F9678C23E922C004063D73B40922C004073003340B7CA303E922C00400998843F7626D43FDA424040864F4B40B7CA303E1F0DBE3F3482773E922C004096784240B7CA3040922C004009980440922C803F55D4E53F864F4B3F55D4E53F922C0040099804403D390B4044ABEE3FE945963F44ABEE3FDA424040C5CD0640922C803FB7CAB03F922C0040922C00407626543EF96E0D3F864F4B3F55D4E53F7626D43FE945963F7626543EB7CAB03E7626543ECA1949405088A33F5088A33F922C0040CC3FEA3F60B19A3F60B19A3F3482F73F7626D43FA7A1B93F9678C23F71DA913F60B19A3F60B19A3F55D4653F922C803F52AE44403482773E3F5FAC3F922C00405088A33F3482773FACED7B400998843F864FCB3F71DA1140C8F32740E945163F7626543F922C803FB7CA3040E7B28540BC16F33F5F1E8A400EE446407626D43FEB6B3740784C754073003340E94516401F0D3E40DA424040E94516403ECC9B40D81C1F40D81C1F40CA19C940DA42404065FDDC40864F4B405341D540ACED7B40FA019E40FEBA4F40FF4DE040B5A48F40D9AFAF40945221400D51B64070478140704781400998044044AB6E40864F4B4042854D4042854D40922C0040D7898E4052AE4440CC3F6A4071DA91404E620240D81C1F40FA019E404E628240922C00403482F740922C804056400641BC167340BAF0D140DA42C04055D4E540F0B77940B637A0401F0D3E400B2B954021335F4082969940967842401B548C40DA424040BC16734000E17040A7A13940D9AFAF403ECC9B4065FD5C40784C754042854D4063D73B40DD68E13F508823403F5F2C400EE446402F3635403482F740922C80400F77D740A9C75A40784CF540C8F3A7406723FE4093BF90408AE10C419452A1407626D440864F4B40ED91D840864F4B4030C9C540FEBA4F40829699401F0D3E400EE44640A47B9840FA019E402EA3A4400B2B9540DA42C040ACED7B404E628240864F4B40E7B28540FEBA4F404E6282403482F740922C004001BA004176265440A834CA40FF4DE0408AE10C41B7CAB04009980441B637A0401276084165FD5C40DA42C0405F1E8A400CBEA54044AB6E40BC16734076265440CC3FEA3FC986B840829699404FF59240A7A1B940B5A48F40A7A1B9401CE71C40FA019E40999E6340BAF05140CA194940922C0041BAF05140B637A040B637A040D81C9F40A3E88740EAD8A6400998844052AEC440DA42404030C9C540FEBA4F40129DF840784C75400CBEA54094522140C5CD8640A3E887407300334009988440C7609740D81C1F4081038940DD68E13F0B2B95403D390B40D7898E40922C8040315C5640099804404E620240DA424040511BB440C8F3274095E5B1401F0D3E40FA019E409678423F67237E40999E6340C986B840DA42C040922C0041B7CA30406690ED40FEBA4F40315C5640F96E0D404E628240B5A40F4044AB6E40099804407626D43F82969940D81C1F4000E170404FF59240ED91584081038940EAD8A64044AB6E407626D43D44ABEE3FFEBACF3F511BB440B637A0405341D540CC3F6A404285CD40922C0040784C754044AB6E40B637A040C760974044AB6E40FA019E40E7B2854009988440F0B779402F363540784C7540A7A13940CA19494065FD5C4093BF904065FD5C40E945963FA3E88740967842400EE4464065FD5C40922C8040C5CD8640348277407300334034827740A7A13940FEBA4F400998844021335F403F5F2C4063D73B40E7B28540FEBACF3F922C004085BCBA40DA42404009988440BAF051402F363540099804404FF5924044ABEE3FFB94AE4044AB6E40FA019E40ACEDFB3F922C80401CE71C403F5FAC40C5CD86403ECC9B40704781403D398B4009988440864F4B40C8F327407626D43FB5A40F40922C803F864F4B4044ABEE3FA47B18405088A33F864FCB3F65FDDC40E7B28540CC3F6A40E94516401CE79C40999E634041F2BC4055D465401CE79C4052AE444088756C40C5CD064088756C400EE4C63F2B7D8340C5CD8640DA4240409452A140B5A40F40A3E88740C5CD064063D73B401CE71C40B637A040A47B18409678C23F922C00400EE446403D390B4076265440129DF8403ECC9B400D51B640A9C75A40999E6340E9459640ED91D8409452A140DD68E140C5CD86409678C240FA019E40829699401CE71C40E7B2854042854D40DA42404071DA914034827740C5CD8640E7B28540C5CD86403ECC9B40EAD8A64034827740FA019E4034827740B637A040DA4240407626D43FDD68E1403ECC9B4042854D40864FCB3FF96E8D4021335F40110AE840E9459640EE24E94088756C402133DF40BAF051408429AA40A9C75A40E7B2854042854D40348277404E6282402D10144050882340C8F3A73FFEBA4F4060B19A3FDA424040F96E8D3FFB942E40348277404E628240CC3F6A4000E17040CC3F6A40945221409452A140BC16F33FB85DC140F0B779401D7AAD403482774071DA914081038940DD686140BAF05140E9459640E945164070478140922C004000000000999E63403482F73EF0B7794060B11A40F96E0D3F922C0040B5A40F40922C803FA3E88740EB6B3740922C0040922C0040F0B7794081038940864F4B40FA019E40CA19494081038940315C5640BAF0514081030940110A6840FB942E400B2B95400CBEA5403ECC9B4000E170408429AA40922C0040922C803F2D101440922C803F42854D403482774042854D400EE4464042854D40810309403F5FAC3F922C0040DA42404044ABEE3FF96E0D40922C803FA7A1393F000000008103893F71DA913F71DA913F922C803F9678423F922C803F922C803F922C0040FB942E4094522140B7CA30404E62024044AB6E40D81C9F3FEB6B3740B5A40F40864F4B40922C0040DA42404044AB6E3F2F363540864F4B4063D73B40922C803F3F5F2C40A7A1B93FED91D83F922C0040DA4240403D390B400EE44640922C804044AB6E40B5A40F4052AE4440C8F3274088756C401CE71C402D101440ED91D83F1CE71C40ED91D83F52AE4440B5A40F40E7B2854084292A40FEBA4F40CA194940DA4240403F5FAC3FBC16734060B19A3FE945163FACEDFB3FCA1949409678423F65FD5C3FDA424040922C8040A9C75A40E7B28540A9C75A40784C754084292A4060B11A400998843F55D4E53F922C0040922C0040922C00404E620240864FCB3F922C8040B5A40F40D81C1F401F0DBE3F3D390B40B5A40F40945221400998043FBC16F33F0998843F52AE4440922C803F7626D43F8103893F9678C23F922C004052AE4440922C803F5088A33FB5A40F40922C004094522140B5A40F4094522140B5A40F4060B19A3F60B19A3F922C00404E620240DA424040DA4240403482773EE9451640B5A40F40E7B28540FEBA4F4088756C40B7CA304060B19A4042854D40F0B77940B5A40F40784C7540922C004009980440922C803F922C0040DA42404044AB6E40922C8040A47B9840922C8040C7609740DA4240404E628240FEBA4F40E7B2854009980440C5CD0640B7CA303E864F4B40B5A40F40B5A48F4009980440CA1949400EE4C63F71DA1140B5A40F4052AE4440922C00403D398B40B5A40F40E9451640922C004044ABEE3F922C8040E9459640DA4240400EE44640D81C9F3F4E620240D81C9F3F5088A33FD81C9F3F5088A33FDA42404000E1704000E17040B5A48F40A47B1840CC3FEA3F922C803FD81C9F3EF96E0D3F0EE4C63F922C803F60B11A403482773EFEBA4F40D81C9F3F922C803FDA42404063D73B409678423F3482F73F00000000F96E8D3DD81C1F3FE945163F0EE4C63F0EE4C63F0EE4C63F2F36B53F922C803FDD68E13F922C004009980440922C0040DD68E13F922C0040922C803F00000000508823409678423FE9451640FEBA4F40BC16F33F71DA913F71DA11403482773E73003340B5A40F403D390B40922C004044AB6E40"> : tensor<2x3x14x15xf32>
    %0 = stablehlo.uniform_quantize %cst_0 : (tensor<3x3x4x5xf32>) -> tensor<3x3x4x5x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>
    %1 = stablehlo.uniform_quantize %cst : (tensor<2x3x9x10xf32>) -> tensor<2x3x9x10x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>
    %2 = stablehlo.transpose %1, dims = [0, 2, 3, 1] : (tensor<2x3x9x10x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>) -> tensor<2x9x10x3x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>
    %3 = stablehlo.transpose %0, dims = [2, 3, 1, 0] : (tensor<3x3x4x5x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>) -> tensor<4x5x3x3x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>
    %4 = stablehlo.convolution(%2, %3) dim_numbers = [b, 0, 1, f]x[0, 1, i, o]->[b, 0, 1, f], window = {lhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<2x9x10x3x!quant.uniform<i8:f32, 0.0039215482917486456:-128>>, tensor<4x5x3x3x!quant.uniform<i8:f32, 0.0039212212843053483:-128>>) -> tensor<2x14x15x3x!quant.uniform<i32:f32, 1.537725862903607E-5>>
    %5 = stablehlo.uniform_quantize %4 : (tensor<2x14x15x3x!quant.uniform<i32:f32, 1.537725862903607E-5>>) -> tensor<2x14x15x3x!quant.uniform<i8:f32, 0.034529659794826133:-128>>
    %6 = stablehlo.transpose %5, dims = [0, 3, 1, 2] : (tensor<2x14x15x3x!quant.uniform<i8:f32, 0.034529659794826133:-128>>) -> tensor<2x3x14x15x!quant.uniform<i8:f32, 0.034529659794826133:-128>>
    %7 = stablehlo.uniform_dequantize %6 : (tensor<2x3x14x15x!quant.uniform<i8:f32, 0.034529659794826133:-128>>) -> tensor<2x3x14x15xf32>
    %8 = stablehlo.custom_call @check.eq(%cst_1, %7) : (tensor<2x3x14x15xf32>, tensor<2x3x14x15xf32>) -> tensor<i1>
    return %8 : tensor<i1>
  }
}
