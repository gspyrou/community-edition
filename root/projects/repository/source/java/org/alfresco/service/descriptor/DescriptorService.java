/*
 * Copyright (C) 2005-2007 Alfresco Software Limited.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

 * As a special exception to the terms and conditions of version 2.0 of 
 * the GPL, you may redistribute this Program in connection with Free/Libre 
 * and Open Source Software ("FLOSS") applications as described in Alfresco's 
 * FLOSS exception.  You should have recieved a copy of the text describing 
 * the FLOSS exception, and it is also available here: 
 * http://www.alfresco.com/legal/licensing"
 */
package org.alfresco.service.descriptor;

import org.alfresco.service.NotAuditable;
import org.alfresco.service.license.LicenseDescriptor;


/**
 * Service for retrieving meta-data about Alfresco stack.
 * 
 * @author David Caruana
 *
 */
// This is not a public service in the normal sense
public interface DescriptorService
{
    /**
     * Get descriptor for the server
     * 
     * @return  server descriptor
     */
    @NotAuditable
    public Descriptor getServerDescriptor();
    
    /**
     * Get descriptor for the repository as it is currently installed.
     * 
     * The current repository descriptor will always be the same as the
     * {@link #getServerDescriptor() server descriptor}.
     * 
     * @return  repository descriptor
     */
    @NotAuditable
    public Descriptor getCurrentRepositoryDescriptor();
    
    /**
     * Get descriptor for the repository as it was when first installed.
     * 
     * @return  repository descriptor
     */
    @NotAuditable
    public Descriptor getInstalledRepositoryDescriptor();
    
    /**
     * Gets the License Descriptor
     * 
     * @return  the license descriptor
     */
    @NotAuditable
    public LicenseDescriptor getLicenseDescriptor();
    
}
