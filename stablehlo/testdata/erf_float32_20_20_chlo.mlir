// RUN: stablehlo-opt --chlo-pre-serialization-pipeline -inline %s | stablehlo-translate --interpret
// RUN: stablehlo-opt --chlo-pre-serialization-pipeline %s | stablehlo-translate --serialize --target=current | stablehlo-translate --deserialize | stablehlo-opt > %t.0
// RUN: stablehlo-opt --chlo-pre-serialization-pipeline %s > %t.1
// RUN: diff %t.0 %t.1

module @jit_main attributes {mhlo.num_partitions = 1 : i32, mhlo.num_replicas = 1 : i32} {
  func.func public @main() -> (tensor<20x20xf32> {jax.result_info = "", mhlo.layout_mode = "default"}) {
    %0 = call @inputs() : () -> tensor<20x20xf32>
    %1 = call @expected() : () -> tensor<20x20xf32>
    %2 = chlo.erf %0 : tensor<20x20xf32> -> tensor<20x20xf32>
    stablehlo.custom_call @check.expect_almost_eq(%2, %1) {has_side_effect = true} : (tensor<20x20xf32>, tensor<20x20xf32>) -> ()
    return %2 : tensor<20x20xf32>
  }
  func.func private @inputs() -> (tensor<20x20xf32> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<"0xB7C03E4019C7EF3F134FE9BE67AEC83F281B823FC488C7BE7693A6C0DFFD544045540640D8B7F340D691653FC8B20140CE90F4BD8C69CABF45330940249DE93F705F913F2C04EA3FFF2B2FBD777DC43E010C5EC0C2A7A5BFAFDBA53CB6FFC4BFE4E92BC029FBBC4077D9D63F1D585040F058B5C070D7A0BEB07332BFBA7D8DC0347837C0D72F58C003D237C0033BEF3FDE12713FD9AE35C04FD7BAC0B92B0BC01152F5BF583C3BC020B50CC08CEA66404C3E513D0DC402C06B9BD7BFEB7F3F40EA852A3FB3121A40B4F146400ACFCCBD6533B240376BAC3FD7EC9FBECFAE7A3FB45FE7BF890C3040015E09C08A0720405E210EC09ECD9940898744406532D5BF7E5F9CC063982C40FD21233F582543C03061693ECA00A3BFAC9F093F94500B40EF09614055E060C0B71610BFECFE5BC0BD60B0BD8E9A32BF2E12B2408369D53F30F6C93FA75F463F82469440B16986C02291D6407418CBC067011740000E7A400E448940B4C078BFF8C939C05B2A843FA8CF98C00E21B63FED539540FB05C5BEB311FA3F403E9DBF8614BB3F21A5BFBF587273C04D05A6C0FA6C36BC62FCEEBFD1CBA73F57DD6ABECA6889BECE8C93C04DEB01BF77981C40B31EDF3FCF7F893F9FEB4140D9E900C0AB9003BFCFD43F4093F262BFACF7F1BEFE265E40BEE7DC40916E023FD55C35C0C34CB9BFA8DF653F6BF8FABFE2E2AEC03133CFC05339A940DC2429C061071E40C3CA90BF13A92F4089A6BABFA8378A3E13BE98C0B2B8CEC0A1C97B40EAA432BF1A7E1F408DFEAEC043A7A3C07045613EDBD32BC01B7AE1BE219048C07C08AC408C064E407F8038C0E8797AC0DD1A0C40C2DA153F46258B4082071C4027316440CB5682C01F4BA73F21381E3E23B6F83FF08082C036533D40DF562C3F701728C06542C5C0FFDDC0BFE8E2FB3D87F387C06BD635C093FA1EC0A617004067D2BEBFBE0E54C05708C43FAE47EABE593E773F089811BE1210123FD0ED97BF43A77DC07B4CBA40F08089C02C728A4020D2C73F842E66C0F57E3C3F446B30C0D1D9D1BFD893524014C13BBFE6457ABFFF035040505C1CC14841074077BB9E40B11CECBE4B0437C01CBAC8BFAC99CB3D95C66E40D4A7A0BF3D4E40C07E62F3BFF9C4EE3F05A822C06226D9401A82FB3FAE4CFCBF33B8F93F7F1A06BF0F0C923FF8C71940B0324CBFE48A1E40B05B45C0BB82C73F0C809AC05E70B43F26C283BEE374264071C8D73FA4288040F668F5C0B02766404C6021BE6199713F49F787C01B4D15C0996F514068897D3E1A0E95BF2D26D0BF0967763EE85E5CC092E28E3F8EEF98BF993749407F20ADC06EF86740E5B1A43F87FF3140A1B3D53FF0615BC0CF95A040165C2F40708F1BC07943E4BF3F27A3BE94D411C097411E409032FF3E24945C3F6B32204024B21BBFA7E903C032FFBA3FBC1A03C084B0B1C05B25A8BE517419BE7D29C540611C10C02B1695BF14478A3EDA6290BF11F99CBEA66DB73FB8E11DC0108A9FC007DB9CBF057CA1C049BACEBEB11E86C0EA99D3402E162C400D3833C08D9DD2BF176311C0CB6DA2BF185C83408C32D8C09DB646C0C6A425C0B6749DBFF681A2407D2991BDD04593BECE259DC013E0BEBF54631FBEDFA919C086AAB4BFA82A5A3E45011FC09AF929C0F6A0F4BD34B3524024D8D83EE7822CC02209C23ED89B4DBFCED9E1BDD07D42C03EFF4CC0DA5C63C07EF61EC03A602A3FE0D82BBFA831BB40E4FCC7BD8A46BF3FE8441ABFB7EBE1C06442AEBFF6E450BF3E5F573F66A85D3F5908523FCD9741C0A74C23C0B382D2C0AFC6BAC0055972C0F92B15BFFE6334C01475CABE64ECE53F246C4AC061BFADC0ACE0A3C030D73C3F431B0040A1F620C04B8E39C0715FD23FBE18514096FDE63E19BE1DC07B0F60C05344B3C0D7BFB3C043676F3D62C6E53FCBC243C0861FD63DB0781C3F4C4450C013447840AA70C4C0B8BFA4BF3EB5FBBE7BC546C054A59640971829405607873F182020C0C454E0BF57D9EDBD8843BBBF3D180CC073EEB6C0E0A03A40AEB61840769E3340A703DE3E3E9D1640D42F3DBF9FD9943F40EA3D40A10BC63EF06F78C06711CBBE925BD4BFC8388C3FDD8077BF118C38C074BE0EC1F6AB04BFDB65FFC05C7D0E406FF3AA3FF6CA9040DBD94B4025912FBFC3DB373E5BDA35400D4FD1C0C415BAC096C82FC09CC7CEBDFFF075C0B7A66640906AD9C02B18563F6E450FBF755C9AC074B106C035C305C00BABB93E9FD9B8BE9D381CC06BB20640"> : tensor<20x20xf32>
    return %cst : tensor<20x20xf32>
  }
  func.func private @expected() -> (tensor<20x20xf32> {mhlo.layout_mode = "default"}) {
    %cst = stablehlo.constant dense<"0x5CFE7F3F3BEF7D3FD31EF6BE4830793F8773593FC040D6BE000080BFD7FF7F3FBE3B7F3F0000803F2A974B3F86EF7E3F0A5409BE188479BFA5607F3F8B7A7D3F6E4A643FD1827D3F328A45BD914BD33EF1FF7FBF27CB6EBF1320BB3CC47178BF78F67FBF0000803F157E7B3FB9FF7F3F000080BF57B1AFBEB8FF2CBF000080BFB5FC7FBFE4FF7FBFCEFC7FBFB3E57D3FD42A513F19FC7FBF000080BF2C767FBFA2477EBFB2FD7FBF11857FBFFBFF7F3F8CE66B3D2B037FBFFB977BBF79FE7F3F7560273F93D47F3F46FF7F3F7455E6BD0000803FA976713F5EC1AEBE617A553FC54A7DBF6FF97F3F95627FBF67E57F3F86917FBF0000803F14FF7F3FC7437BBF000080BF09F77F3F58EC213FEFFE7FBFF96C813E54A46DBF558B0D3FA1777F3FF5FF7F3FF5FF7FBF00EF12BFECFF7FBFB987C6BDB01A2DBF0000803F844B7B3F9F6E793FC7133A3F0000803F000080BF0000803F000080BF73C87F3F0000803F0000803F16A354BF5CFD7FBF0C145B3F000080BFCFAF743F0000803F75D0D3BE8A887E3F3DEC6ABF4B15763FF63C77BFFEFF7FBF000080BF3CD64DBC63E17DBFE1AD6F3F873882BE076897BE000080BF9AED06BFA4DC7F3F717E7C3F2A0C5F3FCCFE7F3F3AE07EBFE85B08BF89FE7F3F1E414ABF3BFFFDBEF1FF7F3F0000803FF95F073FFDFB7FBF519975BF69BE4B3FD6937EBF000080BF000080BF0000803FD3F37FBF94E07F3F95ED63BF32F97F3FD6F775BF2341983E000080BF000080BF0000803FDF212DBF2DE47F3F000080BF000080BF4D267A3E66F67FBFEFE3EEBE64FF7FBF0000803FA6FF7F3F02FD7FBF000080BF697F7F3FDB9C173F0000803FF5DA7F3FF9FF7F3F000080BF87796F3FE51E313EED767E3F000080BF1DFE7F3F81AF283FA6F27FBF000080BFEF8677BFF9650D3E000080BF25FC7FBFF6E27FBF65CF7E3FED0977BFD1FF7FBFE53C783F8D02F7BE87F8533F4A2F23BE998C143FFF2168BF000080BF0000803F000080BF0000803F4805793FFAFF7FBFA2C7333FA6F97FBFC6C57ABFC9FF7F3FC74A33BFEF4C55BFB8FF7F3F000080BF6B487F3F0000803F17AFF8BE8DFC7FBF8B3279BFD4FBE43DFEFF7F3F11926CBF97FE7FBF642A7EBF89DD7D3FADEA7FBF0000803F6F9A7E3FF2A37EBF15847E3F148C0ABF0BB5643F88D37F3F759E3DBFE1E17F3F26FF7FBF8EF5783F000080BF6D2C743FA87491BE9AF07F3FEC9D7B3F0000803F000080BFFCFF7F3FE09834BE3E69513F000080BF70C07FBFC2FF7F3F3C2C8C3E3B8166BF69817ABF6D61883EECFF7FBFF0B5623FDAAE68BF6EFF7F3F000080BFFBFF7F3F34626E3F81FA7F3FDA557B3FECFF7FBF0000803F02F97F3F82D97FBF39037DBF840DB2BEB3AC7FBF2AE17F3F23E5043F27E8463FC4E57F3F9F3A1CBFD0167FBF990F763F1D097FBF000080BF5E20B7BE01DE2BBE0000803FF2A07FBFEB8566BF4F51983E1FAC63BF74BAABBE8011753F31E07FBF000080BF8CBA6ABF000080BF0830DDBE000080BF0000803F9EF67F3F18FB7FBF8AE37ABFCEA97FBF6A626DBF0000803F000080BF42FF7FBF7CEF7FBF5A076BBF0000803F2186A3BD38B5A1BE000080BF440D77BF7B6832BE1AD37FBF5E3E74BF0780723E07E37FBFAFF47FBF085D09BECAFF7F3FBDCEE63EF8F67FBF8BE6D03E34753EBFE6D0FDBDDEFE7FBF9CFF7FBFF7FF7FBFEBE27FBF2745273F075528BF0000803F68F2E0BD2D26773FF51C1BBF000080BF962072BF006240BFB40F443FFC7B473F560A413FC2FE7FBFD0EB7FBF000080BF000080BFFEFF7FBFA21017BF98FB7FBF8914D9BE2E2A7D3F7DFF7FBF000080BF000080BF7701343FAFCF7E3F66E77FBF4DFD7FBF27DA7A3FBFFF7F3F98FDF33ED2DF7FBFF3FF7FBF000080BF000080BF4DEA863DC4267D3F02FF7FBF0EBCF03D1BD51C3FB9FF7FBF0000803F000080BF2A686EBFAE5A03BF42FF7FBF0000803FC6F37F3F96405D3F9BE57FBF6B9F7CBF4E9705BECB2176BF517F7FBF000080BF91FD7F3F8ACF7F3F44FB7F3F92A9EB3EB4C67F3F753B34BFA762663F39FE7F3FDDCED43E000080BF51ABD9BE31257BBF03F1603F081654BF06FD7FBF000080BFD25009BF000080BF7D947F3F59EA703F0000803F8FFF7F3F11FB2ABF09414D3E2AFC7F3F000080BF000080BF47F97FBF1689E8BD000080BFFCFF7F3F000080BF1659433FA94212BF000080BFD1407FBF98337FBFFCABC83EAEDCC7BE8ADB7FBFDF407F3F"> : tensor<20x20xf32>
    return %cst : tensor<20x20xf32>
  }
}