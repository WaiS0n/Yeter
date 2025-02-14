/*
 * ivykis, an event handling library
 * Copyright (C) 2002, 2003, 2009, 2012 Lennert Buytenhek
 * Dedicated to Marija Kulikova.
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License version
 * 2.1 as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License version 2.1 for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License version 2.1 along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifndef __IV_H
#define __IV_H

#ifndef _WIN32
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <unistd.h>
#else
#include <sys/time.h>
#include <windows.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Library initialisation, main loop.
 */
void iv_init(void);
int iv_inited(void);
void iv_main(void);
void iv_quit(void);
void iv_deinit(void);
const char *iv_poll_method_name(void);
void iv_fatal(const char *fmt, ...) __attribute__((noreturn))
	__attribute__((format(printf, 1, 2)));
void iv_set_fatal_msg_handler(void (*handler)(const char *msg));
unsigned long iv_get_thread_id(void);


/*
 * Time handling.
 */
const struct timespec *__iv_now_location_valid(void);

#define iv_now			(*__iv_now_location_valid())
#define iv_validate_now()

void iv_invalidate_now(void);


#ifndef _WIN32
/*
 * File descriptor handling.
 */
struct iv_fd {
	int	fd;
	void	*cookie;
	void	(*handler_in)(void *);
	void	(*handler_out)(void *);
	void	(*handler_err)(void *);
	void	*pad[11];
};

void IV_FD_INIT(struct iv_fd *);
void iv_fd_register(struct iv_fd *);
int iv_fd_register_try(struct iv_fd *);
void iv_fd_unregister(struct iv_fd *);
int iv_fd_registered(const struct iv_fd *);
void iv_fd_set_handler_in(struct iv_fd *, void (*)(void *));
void iv_fd_set_handler_out(struct iv_fd *, void (*)(void *));
void iv_fd_set_handler_err(struct iv_fd *, void (*)(void *));
#endif


#ifdef _WIN32
/*
 * Handle handling.
 */
struct iv_handle {
	HANDLE	handle;
	void	*cookie;
	void	(*handler)(void *);
	void	*pad[13];
};

void IV_HANDLE_INIT(struct iv_handle *);
void iv_handle_register(struct iv_handle *);
void iv_handle_unregister(struct iv_handle *);
int iv_handle_registered(const struct iv_handle *);
void iv_handle_set_handler(struct iv_handle *, void (*)(void *));
#endif


/*
 * Task handling.
 */
struct iv_task {
	void	*cookie;
	void	(*handler)(void *);
	void	*pad[6];
};

void IV_TASK_INIT(struct iv_task *);
void iv_task_register(struct iv_task *);
void iv_task_unregister(struct iv_task *);
int iv_task_registered(const struct iv_task *);


/*
 * Timer handling.
 */
struct iv_timer {
	struct timespec	expires;
	void		*cookie;
	void		(*handler)(void *);
	void		*pad[4];
};

void IV_TIMER_INIT(struct iv_timer *);
void iv_timer_register(struct iv_timer *);
void iv_timer_unregister(struct iv_timer *);
int iv_timer_registered(const struct iv_timer *);


#ifdef __cplusplus
}
#endif


#endif
