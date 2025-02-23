/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_1305(char*, char *);
IKI_DLLESPEC extern void execute_1306(char*, char *);
IKI_DLLESPEC extern void execute_1307(char*, char *);
IKI_DLLESPEC extern void execute_2862(char*, char *);
IKI_DLLESPEC extern void execute_2863(char*, char *);
IKI_DLLESPEC extern void execute_2864(char*, char *);
IKI_DLLESPEC extern void execute_2865(char*, char *);
IKI_DLLESPEC extern void execute_2866(char*, char *);
IKI_DLLESPEC extern void execute_2867(char*, char *);
IKI_DLLESPEC extern void execute_2868(char*, char *);
IKI_DLLESPEC extern void execute_1313(char*, char *);
IKI_DLLESPEC extern void execute_1314(char*, char *);
IKI_DLLESPEC extern void execute_1315(char*, char *);
IKI_DLLESPEC extern void execute_1316(char*, char *);
IKI_DLLESPEC extern void execute_1320(char*, char *);
IKI_DLLESPEC extern void execute_1321(char*, char *);
IKI_DLLESPEC extern void execute_1324(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_1457(char*, char *);
IKI_DLLESPEC extern void execute_1458(char*, char *);
IKI_DLLESPEC extern void execute_2861(char*, char *);
IKI_DLLESPEC extern void execute_1309(char*, char *);
IKI_DLLESPEC extern void execute_1310(char*, char *);
IKI_DLLESPEC extern void execute_1311(char*, char *);
IKI_DLLESPEC extern void execute_1312(char*, char *);
IKI_DLLESPEC extern void execute_2869(char*, char *);
IKI_DLLESPEC extern void execute_2870(char*, char *);
IKI_DLLESPEC extern void execute_2871(char*, char *);
IKI_DLLESPEC extern void execute_2872(char*, char *);
IKI_DLLESPEC extern void execute_2873(char*, char *);
IKI_DLLESPEC extern void execute_2874(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[32] = {(funcp)execute_1305, (funcp)execute_1306, (funcp)execute_1307, (funcp)execute_2862, (funcp)execute_2863, (funcp)execute_2864, (funcp)execute_2865, (funcp)execute_2866, (funcp)execute_2867, (funcp)execute_2868, (funcp)execute_1313, (funcp)execute_1314, (funcp)execute_1315, (funcp)execute_1316, (funcp)execute_1320, (funcp)execute_1321, (funcp)execute_1324, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_1457, (funcp)execute_1458, (funcp)execute_2861, (funcp)execute_1309, (funcp)execute_1310, (funcp)execute_1311, (funcp)execute_1312, (funcp)execute_2869, (funcp)execute_2870, (funcp)execute_2871, (funcp)execute_2872, (funcp)execute_2873, (funcp)execute_2874, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 32;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_CSA64_behav/xsim.reloc",  (void **)funcTab, 32);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_CSA64_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_CSA64_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_CSA64_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_CSA64_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_CSA64_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
