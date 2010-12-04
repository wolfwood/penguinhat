module penguinhat;

// is this implicit?
import mindrt.util;

extern(C):


/* ====== Driver Interface Primitives ====== */

// int bus_register(struct bus_type *bus) 
bus_register

// void bus_unregister(struct bus_type *bus) 
bus_unregister

// int device_register(struct device *dev)
device_register

// void device_unregister(struct device *dev)
device_unregister

// int driver_register(struct device_driver *drv)
driver_register

// void driver_unregister(struct device_driver *)
driver_unregister


/* ====== Kernel-> Userspace Event Delivery ====== */

// we are already in userspace, what to do?

// int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
add_uevent_var


/* ====== Flavors of Printf ====== */

// int dev_err(const struct device *dev, const char *fmt, ...)
alias dev_err dev_warn;

// int dev_set_name(struct device *dev, const char *fmt, ...)
alias dev_set_name dev_warn;

// int dev_warn(const struct device *dev, const char *fmt, ...)
int dev_warn(sdevice *dev, char *fmt, ...){
	printf(fmt, ...);
	return 0;
}

// void panic(const char * fmt, ...)
void panic(char * fmt, ...){
	printf(fmt, ...);
	exit(-1);
}

//int printf(const char *fmt, ...)
//printf - get from libc


/* ======= Memory ====== */

// punt to libc

// void *__kmalloc(size_t size, gfp_t flags)
void __kmalloc(size_t size, gfp_t flags){
	return malloc(size);
}

// ???
void __tracepoint_kmalloc(){
	//XXX: may be useful to not when this is called
	return;
}

// void kfree(const void *objp)
void kfree(ubyte* p){
	free(p);
}


/* ====== Utility Functions ====== */

// unsigned long __phys_addr(unsigned long x)
ulong __phys_addr(ulong x){
	// XXX: Userspace paging trick magic? or use IO/MMU and return virtual addy?

	// XXX: can't actually find where 
	return x;
}


/* == XXX: Get These from Libc? == 

// int sprintf(char * buf, const char * fmt, ...)
int sprintf(){
	// log inputs for now

	// XXX: do that thing?
	
	return 0;
}

// char* strcpy(char* dest, const char* src)
void* strcpy(void* dest, source){
	return memcpy(dest, src, strlen(src));
}
*/

/* ====== Types! ====== */

//typedef unsigned __bitwise__ gfp_t;
alias uint gfp_t;

alias ulong size_t;

/* struct bus_type {
        const char              *name;
        struct bus_attribute    *bus_attrs;
        struct device_attribute *dev_attrs;
        struct driver_attribute *drv_attrs;

        int (*match)(struct device *dev, struct device_driver *drv);
        int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
        int (*probe)(struct device *dev);
        int (*remove)(struct device *dev);
        void (*shutdown)(struct device *dev);

        int (*suspend)(struct device *dev, pm_message_t state);
        int (*resume)(struct device *dev);

        const struct dev_pm_ops *pm;

        struct bus_type_private *p;
};*/

struct bus_type{
	
}

/*struct device {
        struct device           *parent;

        struct device_private   *p;

        struct kobject kobj;
        const char              *init_name; // initial name of the device
struct device_type      *type;

struct mutex            mutex;  // mutex to synchronize calls to
																// its driver.
																

struct bus_type *bus;           // type of bus device is on 
struct device_driver *driver;   // which driver has allocated this
																//	 device
void            *platform_data; // Platform specific data, device
																//	 core doesn't touch it 
struct dev_pm_info      power;

#ifdef CONFIG_NUMA
int             numa_node;      // NUMA node this device is close to 
#endif
u64             *dma_mask;      // dma mask (if dma'able device) 
u64             coherent_dma_mask;// Like dma_mask, but for
                                             //alloc_coherent mappings as
                                             //not all hardware supports
                                             //64 bit addresses for consistent
                                             //allocations such descriptors. 

struct device_dma_parameters *dma_parms;

struct list_head        dma_pools;      // dma pools (if dma'ble)

struct dma_coherent_mem *dma_mem; // internal for coherent mem
																	//	 override 
// arch specific additions 
struct dev_archdata     archdata;
#ifdef CONFIG_OF
struct device_node      *of_node;
#endif

dev_t                   devt;   // dev_t, creates the sysfs "dev" 

spinlock_t              devres_lock;
struct list_head        devres_head;

struct klist_node       knode_class;
struct class            *class;
const struct attribute_group **groups;  // optional groups 

void    (*release)(struct device *dev);
};*/

struct device{
}


/*struct device_driver {
        const char              *name;
        struct bus_type         *bus;

        struct module           *owner;
        const char              *mod_name;      // used for built-in modules

bool suppress_bind_attrs;       // disables bind/unbind via sysfs

#if defined(CONFIG_OF)
const struct of_device_id       *of_match_table;
#endif

int (*probe) (struct device *dev);
int (*remove) (struct device *dev);
void (*shutdown) (struct device *dev);
int (*suspend) (struct device *dev, pm_message_t state);
int (*resume) (struct device *dev);
const struct attribute_group **groups;

const struct dev_pm_ops *pm;

struct driver_private *p;
};*/

struct device_driver{

}