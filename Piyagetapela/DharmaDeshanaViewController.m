//
//  DharmaDeshanaViewController.m
//  Piyagetapela
//
//  Created by Varuna Lekamwasam on 11/28/13.
//  Copyright (c) 2013 VarunaRL. All rights reserved.
//


#import "DharmaDeshanaViewController.h"

@interface DharmaDeshanaViewController ()

@end

@implementation DharmaDeshanaViewController

@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    
    return self;
}

-(void) viewDidLoad{
    NSString * JSON_MEDIA_DATA = @"{\"Buddha-vandana\":[{\"title\":\"Ven Kahagolle Somavansa Thero\",\"mp3\":\"/media/3786/audiojoiner131015224513.mp3\"},{\"title\":\"Ven Pathegama Sumanarathana Thero\",\"mp3\":\"/media/3828/bb.mp3\"}],\"ven-matara-sri-gnanarama-maha-thero\":[{\"title\":\"Anapanasathi\",\"mp3\":\"/media/1970/aanapanasat.mp.mp3\"},{\"title\":\"Attarasamahavipassana\",\"mp3\":\"/media/1982/attarasa_mahavipassana_-01.mp3\"},{\"title\":\"Haanabhagiya-01\",\"mp3\":\"/media/2006/bhagawa_gunaya_-01.mp3\"},{\"title\":\"Haanabhagiya-02\",\"mp3\":\"/media/2018/haanabhagiya-02.mp3\"},{\"title\":\"Indriyasanwaraya\",\"mp3\":\"\"},{\"title\":\"kayanupassana\",\"mp3\":\"/media/2038/kayanupassana.mp3\"},{\"title\":\"Mahasalayathana\",\"mp3\":\"/media/2050/maha_salayatana.mp3\"},{\"title\":\"Naidan-01\",\"mp3\":\"/media/2066/naidan_-01.mp3\"},{\"title\":\"Naidan-02\",\"mp3\":\"/media/2078/owaada_-02.mp3\"},{\"title\":\"Naidan-03\",\"mp3\":\"/media/2086/naidan_-003.mp3\"},{\"title\":\"Appamadena\",\"mp3\":\"/media/2102/appamadena.mp3\"},{\"title\":\"Bhagawagunaya-01\",\"mp3\":\"/media/2114/bhagawa_gunaya_-01.mp3\"},{\"title\":\"Dibbachakku\",\"mp3\":\"/media/2130/dibbachakku.mp3\"},{\"title\":\"Ovadeyya\",\"mp3\":\"/media/2142/ovadeyya.mp3\"},{\"title\":\"Owaada-01\",\"mp3\":\"/media/2158/owaada_-01.mp3\"},{\"title\":\"Owaada-02\",\"mp3\":\"/media/2170/owaada_-02.mp3\"},{\"title\":\"Owaada-03\",\"mp3\":\"/media/2182/owaada_-03.mp3\"},{\"title\":\"Owaada-04\",\"mp3\":\"/media/2198/owaada_-04.mp3\"},{\"title\":\"Owaada-05\",\"mp3\":\"/media/2202/owaada_-05.mp3\"},{\"title\":\"panchaskanda\",\"mp3\":\"/media/2218/panchaskanda.mp3\"},{\"title\":\"Sabbasawa\",\"mp3\":\"/media/2351/-sabbasawa_01.mp3\"},{\"title\":\"Sabbasawa-02\",\"mp3\":\"/media/2363/-sabbasawa_02.mp3\"},{\"title\":\"samadhi-01\",\"mp3\":\"/media/2375/-samadhi_01.mp3\"},{\"title\":\"samadhi-02\",\"mp3\":\"/media/2387/-samadhi_02.mp3\"},{\"title\":\"samadhi-03\",\"mp3\":\"/media/2399/-samadiya.mp3\"},{\"title\":\"yogiovada\",\"mp3\":\"/media/2411/yogi_ovada.mp3\"},{\"title\":\"Yathabubbulakam-01\",\"mp3\":\"/media/2427/yatha_bubbulakam_-01.mp3\"},{\"title\":\"Yathabubbulakam-02\",\"mp3\":\"/media/2439/yatha_bubbulakam_-02.mp3\"},{\"title\":\"MatharaGanaramaMahimiBuddhaVandanava\",\"mp3\":\"/media/3612/mathara_mahime_bhudda_vandanawa.mp3\"},{\"title\":\"Anusasanava\",\"mp3\":\"/media/3620/m.mp3\"},{\"title\":\"VasAnusasanava\",\"mp3\":\"/media/3628/m-1.mp3\"}],\"ven-kadawadduwa-sri-jinawansa-maha-thero\":[{\"title\":\"sararaanagaracha\",\"mp3\":\"/media/1906/01-sarara.anagaracha.mp3\"},{\"title\":\"Arabatha.nekkamatha\",\"mp3\":\"/media/2451/02-arabatha.nekkamatha.mp3\"},{\"title\":\"Sanvaraththan\",\"mp3\":\"/media/2463/03-sanvaraththan.phanaththan.mp3\"},{\"title\":\"Yathaagaran\",\"mp3\":\"/media/2475/05-yathaagaran.mp3\"},{\"title\":\"Dhamma.desana\",\"mp3\":\"/media/2487/04-dhamma.desana.mp3\"},{\"title\":\"susutha.sutha\",\"mp3\":\"/media/2499/07-susutha.sutha.vaddane.mp3\"},{\"title\":\"DhammaDesana\",\"mp3\":\"/media/2511/08-dhammadesana.mp3\"},{\"title\":\"DhammaDesana-02\",\"mp3\":\"/media/2523/09-dhammadesana.mp3\"},{\"title\":\"Appamathocha\",\"mp3\":\"/media/2535/12-appamathocha.mp3\"},{\"title\":\"DhammaDesana-03\",\"mp3\":\"/media/2547/13-dhamma.desana.mp3\"},{\"title\":\"DhammaDesana-04\",\"mp3\":\"/media/2559/14-dhamma.desana.mp3\"},{\"title\":\"Sethpereth\",\"mp3\":\"/media/2571/15-seth.pereth.mp3\"},{\"title\":\"Sethpereth\",\"mp3\":\"/media/2587/19-pereth.mp3\"},{\"title\":\"Finaldiscussion\",\"mp3\":\"/media/2599/20-final_discussion.mp3\"},{\"title\":\"MahimiCharethaya\",\"mp3\":\"/media/2607/22-mahimi.charethapadanaya.mp3\"}],\"ven-na-uayane-ariyadhamma-thero\":[{\"title\":\"AcintyaBuddaGuna\",\"mp3\":\"/media/392/003_acintya_budda_guna.mp3\"},{\"title\":\"AbidhamNimthera\",\"mp3\":\"/media/398/002_abidham_nimthera.mp3\"},{\"title\":\"AgaSawPadawiPirinemeema\",\"mp3\":\"/media/404/004_agasaw_padawi_pirinemeema.mp3\"},{\"title\":\"AggidattaBrhamana\",\"mp3\":\"/media/410/005_aggidatta_brhamana.mp3\"},{\"title\":\"AkethuThapasaWatha\",\"mp3\":\"/media/416/006_akethu_thapasa_watha.mp3\"},{\"title\":\"AnawataggaSanuktaSutta\",\"mp3\":\"/media/422/007_anawatagga_sanukta_sutta.mp3\"},{\"title\":\"Anekajathisansaran\",\"mp3\":\"/media/428/008_aneka_jathi_sansaran.mp3\"},{\"title\":\"AnnahiLabhopanisa\",\"mp3\":\"/media/772/010_annahi_labhopanisa.mp3\"},{\"title\":\"ApakalaPinAnAyatadiyahakida\",\"mp3\":\"/media/778/011_apa_kala_pin_an_ayata_diya_hakida.mp3\"},{\"title\":\"AriyaAttangaMaga\",\"mp3\":\"/media/787/014_ariya_attanga_maga.mp3\"},{\"title\":\"KalpaWibhaga\",\"mp3\":\"/media/797/015_kalpa_wibhaga__discussion_.mp3\"},{\"title\":\"DahammaSakachcha\",\"mp3\":\"/media/803/016_dahamma_sakachcha.mp3\"},{\"title\":\"DhammaDiscussionatSLBC\",\"mp3\":\"/media/809/018_dhamma_discussion_at_slbc.mp3\"},{\"title\":\"Ariyowathunnibhawo\",\"mp3\":\"/media/815/019_ariyowa_thunnibhawo.mp3\"},{\"title\":\"AsareSaraMathino\",\"mp3\":\"/media/821/021_asare_sara_mathino.mp3\"},{\"title\":\"AsayaAnusayaGnana\",\"mp3\":\"/media/827/022_asaya_anusaya_gnana.mp3\"},{\"title\":\"AschryavathBudurajananVahanse\",\"mp3\":\"/media/833/023_aschryavath_budurajanan_vahanse.mp3\"},{\"title\":\"AsivisopamaSutthaDesana\",\"mp3\":\"/media/839/024_asivisopama_suttha_desana.mp3\"},{\"title\":\"AtharamagaNonawatheeNiwanata\",\"mp3\":\"/media/845/026_atharamaga_nonawathee_niwanata.mp3\"},{\"title\":\"AcharakangathaSutta\",\"mp3\":\"/media/1013/027_awijarasdgth_sutta.mp3\"},{\"title\":\"BhagavaGunaya\",\"mp3\":\"/media/1021/031_bhagava_gunaya.mp3\"}],\"ven-rahathungoda-bodhirathana-thero\":[{\"title\":\"DharmaRathnaya\",\"mp3\":\"/media/1683/rahathungoda_bodhirathana_thero.mp3\"}],\"ven-meethalawe-vineetha-thero\":[{\"title\":\"DhammaDesana-01\",\"mp3\":\"/media/1833/ven_meethalawe_vineetha_thero_bana_-_01.mp3\"},{\"title\":\"DhammaDesana-02\",\"mp3\":\"/media/1862/ven_meethalawe_vineetha_thero_bana_-_02.mp3\"},{\"title\":\"DhammaDesana-03\",\"mp3\":\"/media/1886/ven_meethalawe_vineetha_thero_bana_-_06.mp3\"},{\"title\":\"DhammaDesana-04\",\"mp3\":\"/media/1898/ven_meethalawe_vineetha_thero_bana_-_04.mp3\"},{\"title\":\"DhammaDesana-05\",\"mp3\":\"/media/1950/ven_meethalawe_vineetha_thero_bana_-_05.mp3\"},{\"title\":\"DhammaDesana-06\",\"mp3\":\"/media/1958/ven_meethalawe_vineetha_thero_bana_-_03__2_.mp3\"},{\"title\":\"BRAMMAYANASUTTA-07\",\"mp3\":\"/media/2628/20120921buddistcasarathchandra.mp3\"},{\"title\":\"Saththapadavarasutta-08\",\"mp3\":\"/media/2668/vemvtbauddayaradiof130304.mp3\"},{\"title\":\"SammaDettiSutta-09\",\"mp3\":\"/media/2769/vemvtbauddayatvf130304.mp3\"},{\"title\":\"SathiBatho\",\"mp3\":\"/media/3302/2012-08-25_meethalawe_vineetha_thero.mp3\"},{\"title\":\"Averuddan..\",\"mp3\":\"/media/3310/2012-08-25_meethalawe_vineetha_thero.mp3\"},{\"title\":\"Bhuddo..\",\"mp3\":\"/media/3318/2012-08-25_meethalawe_vineetha_thero.mp3\"},{\"title\":\"MarananussathiBavana\",\"mp3\":\"/media/3604/marana_sathiya.mp3\"}],\"ven-dasawatte-sumaseela-thero\":[{\"title\":\"Anithyaprathisan...\",\"mp3\":\"/media/4738/01_anithya_prathisanuktha_dharmaya.mp3\"},{\"title\":\"AryaAshtangika..\",\"mp3\":\"/media/4770/02_arya_ashtangika_margaya.mp3\"},{\"title\":\"AnapanasathiSut..\",\"mp3\":\"/media/4778/03_anapanasathi_suthraya.mp3\"},{\"title\":\"Bhavanapoorvakkruthi\",\"mp3\":\"/media/4786/04_bhavana_poorvakkruthi.mp3\"},{\"title\":\"AnapanasathiBhavanaKarmastana\",\"mp3\":\"/media/4794/05_anapanasathi_bhavana_kamatahan.mp3\"},{\"title\":\"UpekshaSambojjanga..\",\"mp3\":\"/media/4802/06_upeksha_sambojjangaya.mp3\"},{\"title\":\"MelovaAbhivurdeya\",\"mp3\":\"/media/4814/07_melova_abhivurdhiya.mp3\"},{\"title\":\"DahamGunaya\",\"mp3\":\"/media/4818/08_daham_gunaya.mp3\"},{\"title\":\"ChullahaththiPadhopa..\",\"mp3\":\"/media/4830/09_chullahaththi_padhopama____suthraya.mp3\"},{\"title\":\"PrathipaththiPinkam\",\"mp3\":\"/media/4834/10__prathipaththi__pinkam___hethu_-phala_dharma-dharma__sakachcha_.mp3\"}],\"ven-bulathsinghala-sumangala-thero\":[{\"title\":\"Ragocha..\",\"mp3\":\"/media/3222/sumangala.mp3\"},{\"title\":\"YedassanaVaran..\",\"mp3\":\"/media/3238/ven_bulathsinghala_sumangala-anuththariya-damma.mp3\"},{\"title\":\"AevamevakoBikkawe\",\"mp3\":\"/media/3250/ven_bulathsinhala_sumangala_-_maha-gopalak-sutta.mp3\"},{\"title\":\"SaddaBeejan..\",\"mp3\":\"/media/3266/ven_bulathsinhala_sumangala-kasibharadwaja.mp3\"},{\"title\":\"YochaBhuddhancha.\",\"mp3\":\"/media/3454/00.bulathsinhala_sumangala_2009_02_24_chathusachcha.mp3\"},{\"title\":\"Upamako..\",\"mp3\":\"/media/3467/01.most_ven_bulathsinghala_sumangala_himi_asivisopama_sutta.mp3\"},{\"title\":\"Awnmesuthan..\",\"mp3\":\"/media/3475/02.dananjani_sutta_2009_08_09.mp3\"},{\"title\":\"Areyawansasutta\",\"mp3\":\"/media/3483/05_pindapatha_ariywansa_desawa.mp3\"},{\"title\":\"PaharadaSutta..\",\"mp3\":\"/media/3491/07.paharada_sutta_2011_02_02.mp3\"},{\"title\":\"Mamasankappa..\",\"mp3\":\"/media/3499/08.paramitha_2011_06_16.mp3\"},{\"title\":\"HattaSanyatho..\",\"mp3\":\"/media/3508/09.hatta_sanyatho_ruhunu.mp3\"}],\"ven-kahagolle-somawansha-thero\":[{\"title\":\"MiytreeBawanawa\",\"mp3\":\"/media/1031/2011-05-04_kahagolle_somawansha_thero_-_miytree_bawanawa.mp3\"},{\"title\":\"AgraDayaka\",\"mp3\":\"/media/1267/2012-07-25_ven.kahagolle_somawansha_thero_-_agra_dayaka.mp3\"},{\"title\":\"DethisWiyanjana\",\"mp3\":\"/media/1275/2012-07-23_ven.kahagolle_somawansa_thero_-_dethis_wyanjana.mp3\"},{\"title\":\"PinehiAnisansa\",\"mp3\":\"/media/1395/2012_04_09_bana_10.30am_kahagolle_somawansa_himi_-_pinehi_anisansa.mp3\"},{\"title\":\"MahaPiritha\",\"mp3\":\"/media/1691/maha_piritha.mp3\"},{\"title\":\"Baddekaraththasutta\",\"mp3\":\"/media/2801/110409_002.mp3\"},{\"title\":\"AnandaSutta\",\"mp3\":\"/media/2817/001.ananda_sutta.mp3\"},{\"title\":\"PatichchaSamuppada\",\"mp3\":\"/media/2825/2011.12.20-ven.kahagolle_somavansa_thero.mp3\"},{\"title\":\"ThanpuththaManu..\",\"mp3\":\"/media/2847/2012.06.01-ven.kahagolle_somawansa_thero.mp3\"},{\"title\":\"Magganangeko...\",\"mp3\":\"/media/2855/2012.06.25-ven.kahagolle_somawansa_thero.mp3\"},{\"title\":\"Yodatanha...\",\"mp3\":\"/media/2875/yodatanha.mp3\"},{\"title\":\"Sanatha...\",\"mp3\":\"/media/2887/110416_001.mp3\"},{\"title\":\"Chaththaro..\",\"mp3\":\"/media/2895/110409_002.mp3\"},{\"title\":\"Soathananda..\",\"mp3\":\"/media/2903/110416_002.mp3\"},{\"title\":\"Bodhipoojava\",\"mp3\":\"/media/2919/110416_003.mp3\"},{\"title\":\"SachekoBekkave..\",\"mp3\":\"/media/2927/2013-02-04_kahagolle_somawansa_thero.mp3\"},{\"title\":\"SeyyathapeGAMINI..\",\"mp3\":\"/media/2935/2013-01-08_kahagolle_somawansa_thero.mp3\"},{\"title\":\"Yassakayenavachaya\",\"mp3\":\"/media/2943/2013.04.13-ven.kahagolle_somawansha_thero.mp3\"},{\"title\":\"AththiseyaPareyaye\",\"mp3\":\"/media/2951/2013.01.09-ven.kahagolle_somawansha_thero.mp3\"},{\"title\":\"DasaemeBekkawe..\",\"mp3\":\"/media/2959/2012-01-04_kahagolle_somawansha_thero.mp3\"},{\"title\":\"BagavathoSo..\",\"mp3\":\"/media/2967/2013_01_30_kahagolle_somawansa_himi_6.00am_.mp3\"},{\"title\":\"AdeththaPareyaya..\",\"mp3\":\"/media/2975/2013_02_10_kahagolle_somawansa_himi.mp3\"},{\"title\":\"ArahanGunaya\",\"mp3\":\"/media/2983/2011-09-21-arahan.mp3\"},{\"title\":\"SammasamBhuddaGunaya\",\"mp3\":\"/media/2991/2011-09-28-samma_sambudho.mp3\"},{\"title\":\"SugathaGunaya\",\"mp3\":\"/media/2999/2011-10-12-sugatho.mp3\"},{\"title\":\"LokaviduGunaya\",\"mp3\":\"/media/3007/2011-10-19-lokavidu.mp3\"},{\"title\":\"AnuththaroGunaya\",\"mp3\":\"/media/3015/2011-10-26-anutharo_purisa_damma_sarathi.mp3\"},{\"title\":\"SaththaGunaya\",\"mp3\":\"/media/3023/2011-11-02-sattha_deva_manusanan.mp3\"},{\"title\":\"BuddoGunaya\",\"mp3\":\"/media/3031/2011-11-09-buddho.mp3\"},{\"title\":\"BagawaGunaya\",\"mp3\":\"/media/3039/2011-11-16-bagawa.mp3\"},{\"title\":\"Devathapathi...\",\"mp3\":\"/media/3047/110111_002.mp3\"},{\"title\":\"DvaththinsaMaha\",\"mp3\":\"/media/3164/bana.mp3\"},{\"title\":\"AththanavaKathan..\",\"mp3\":\"/media/3334/110503_001.mp3\"},{\"title\":\"Dhammavijaya..\",\"mp3\":\"/media/3342/110430_001.mp3\"},{\"title\":\"Ukkiththa..\",\"mp3\":\"/media/3390/110430_002.mp3\"},{\"title\":\"Ethikobekkawe..\",\"mp3\":\"/media/3398/110501_001.mp3\"},{\"title\":\"EthanSanthan..\",\"mp3\":\"/media/3410/110501_002.mp3\"},{\"title\":\"AkadasaDhamma..\",\"mp3\":\"/media/3524/110104_001.mp3\"},{\"title\":\"PaneecheeVano..\",\"mp3\":\"/media/3532/110101_004.mp3\"},{\"title\":\"Yochesaththa..\",\"mp3\":\"/media/3540/110105_001.mp3\"},{\"title\":\"NedenanwaPawaththaran..\",\"mp3\":\"/media/3548/110105_002.mp3\"},{\"title\":\"Naahanbekkawe..\",\"mp3\":\"/media/3556/110507_002.mp3\"},{\"title\":\"Akapuggalo..\",\"mp3\":\"/media/3572/110507_002.mp3\"},{\"title\":\"Naanthalikke..\",\"mp3\":\"/media/3636/bana_mp3.mp3\"},{\"title\":\"Mappaman..\",\"mp3\":\"/media/3644/110421_001.mp3\"},{\"title\":\"Yoappa..\",\"mp3\":\"/media/3656/110104_0013.mp3\"},{\"title\":\"Dwalesate..\",\"mp3\":\"/media/3664/110106_001.mp3\"},{\"title\":\"Danandathva..\",\"mp3\":\"/media/3672/110109_001.mp3\"},{\"title\":\"Bahutha..\",\"mp3\":\"/media/3680/110106_002.mp3\"},{\"title\":\"Sathipattana..\",\"mp3\":\"/media/3688/110113_001.mp3\"},{\"title\":\"Kosajjan..\",\"mp3\":\"/media/3724/dsa.mp3\"},{\"title\":\"Cherathwasin..\",\"mp3\":\"/media/3732/110101_005.mp3\"},{\"title\":\"Sadho...\",\"mp3\":\"/media/3744/110415_001.mp3\"},{\"title\":\"Ahensakaye..\",\"mp3\":\"/media/3752/110428_001-h.mp3\"},{\"title\":\"Vejjacharana..\",\"mp3\":\"/media/3768/110428_002-oo.mp3\"}]}";
    
    data = [NSJSONSerialization JSONObjectWithData:[JSON_MEDIA_DATA dataUsingEncoding:NSUTF8StringEncoding]  options:kNilOptions error:nil];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TheroItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thero" forIndexPath:indexPath];
    NSString * imageURI,*label,*key;
    switch (indexPath.row) {
        case 0:
            imageURI = @"matara-sri-gnanarama-thero.png";
            label = @"පූජ්‍ය​ මාතර ශ්‍රී ඥානාරාම​ ස්වාමීන් වහන්සේ";
            key = @"ven-matara-sri-gnanarama-maha-thero";
            break;
        case 1:
            imageURI = @"kadawedduwa-sri-jinawansha-thero.png";
            label = @"පූජ්‍ය​ කඩවැද්දුව ශ්‍රී ජිනවංශ​ ස්වාමීන් වහන්සේ";
            key = @"ven-kadawadduwa-sri-jinawansa-maha-thero";
            break;
        case 2:
            imageURI = @"na-uyane-ariyadhamma-thero.png";
            label = @"පූජ්‍ය​ නා උයනේ අරියධම්ම​ ස්වාමීන් වහන්සේ";
            key = @"ven-na-uayane-ariyadhamma-thero";
            break;
        case 3:
            imageURI = @"rahathungoda-bodhirathana-thero.png";
            label = @"පූජ්‍ය​ රහතුන්ගොඩ බෝධිරතන​ ස්වාමීන් වහන්සේ";
            key = @"ven-rahathungoda-bodhirathana-thero";
            break;
        case 4:
            imageURI = @"meethalawe-wineetha-thero.png";
            label = @"අති පූජ්‍ය​ මීතලාවේ විනීත​ ස්වාමීන් වහන්සේ";
            key = @"ven-meethalawe-vineetha-thero";
            break;
        case 5:
            imageURI = @"dasawatte-sumanaseela-thero.png";
            label = @"පූජ්‍ය දසවත්තේ සුමනසීල​ ස්වාමීන් වහන්සේ";
            key = @"ven-dasawatte-sumaseela-thero";
            break;
        case 6:
            imageURI = @"bulathsinghala-sumangala-thero.png";
            label = @"පූජ්‍ය බුලත්සිංහල සුමන ස්වාමීන් වහන්සේ";
            key = @"ven-bulathsinghala-sumangala-thero";
            break;
        case 7:
            imageURI = @"kahagolle-somawansha-thero.png";
            label = @"පූජ්‍ය​ කහගොල්ලේ සෝමවංශස ස්වාමීන් වහන්සේ";
            key = @"ven-kahagolle-somawansha-thero";
            break;
        case 8:
            imageURI = @"laggala-kalyanawansa-thero.png";
            label = @"පූජ්‍ය​ ලග්ගල කල්‍යාණවංශ​ ස්වාමීන් වහන්සේ";
            key = @"ven-laggala-kalyanawansha-thero";
            break;
        case 9:
            imageURI = @"kelaniye-vipulagana-thero.png";
            label = @"පූජ්‍ය​ කැළණියේ විපුලඥාන​ ස්වාමීන් වහන්සේ";
            key = @"ven-kelaniye-vipulagnana-thero";
            break;
        case 10:
            imageURI = @"kehellpannala-sumana-thero.png";
            label = @"පූජ්‍ය​ කෙහෙල්පන්නල සුමන ස්වාමීන් වහන්සේ";
            key = @"ven-kehellpannala-sumana-thero";
            break;
        default:
            break;
    }
    
    cell.image.image = [UIImage imageNamed:imageURI];
    cell.label.text = label;
    cell.key = key;
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"sermonsOfThero"])
    {
        DeshanaListViewController * viewController = [segue destinationViewController];
        TheroItemCell * sendby = (TheroItemCell *)sender;
        viewController.image = sendby.image.image;
        viewController.name = sendby.label.text;
        viewController.audioItemList = [data objectForKey:sendby.key];
    }
}



@end
